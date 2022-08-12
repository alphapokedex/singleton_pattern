import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:singleton_pattern/config/api_config.dart';
import 'package:singleton_pattern/data/api/connectivity_service.dart';
import 'package:singleton_pattern/data/box/preference_box.dart';
import 'package:singleton_pattern/data/model/model_export.dart';
import 'package:singleton_pattern/ui/components/components.dart';
import 'package:singleton_pattern/utilities/core.dart';

class Http with Core, Components, LogUtil {
  factory Http() => _singleton;

  Http._();

  static final Http _singleton = Http._();

  /// [Http] singleton instance for public use.
  static Http get i => _singleton;

  Future<ApiResponse<T>> req<T>({
    required String endpoint,
    required ReqType reqType,
    Map? body,
    List<int>? bytes,
    String? filePath,
    Map<String, String>? queryParams,
    bool authorizedRequest = true,
    bool basicAuth = false,
    bool loader = true,
  }) async {
    /// In case of file upload, [filePath] or [bytes] must be given
    /// NOTE: filePath & bytes must not be given at once, regardless it will
    /// use based on web or mobile
    String? token, basicAuthToken;
    late Response mongoResponse;
    late ApiResponse<T> returnResponse;
    Uri uri = Uri(
      scheme: ApiConfig.i.scheme,
      host: ApiConfig.i.baseUri.path,
      port: ApiConfig.i.port,
      path: endpoint,
      queryParameters: queryParams,
    );

    if (authorizedRequest) token = PreferenceBox.i.token;
    assert(authorizedRequest && token == null, '');
    if (basicAuth) basicAuthToken = ApiConfig.i.basicAuth;

    final Map<String, String> headers = {
      if (authorizedRequest && !basicAuth)
        HttpHeaders.authorizationHeader: 'Bearer $token',
      if (!authorizedRequest && basicAuth)
        HttpHeaders.authorizationHeader: 'Basic $basicAuthToken',
      HttpHeaders.contentTypeHeader: 'Application/JSON',
    };

    try {
      if (!kIsWeb && kDebugMode && token != null) {
        wtfLog('Token >> \n$token');
        if (body != null) {
          debugLog('Request body >> \n$body');
        }
      }
      if (loader) navigator.showLoader();

      switch (reqType) {
        case ReqType.get:
          mongoResponse = await get(
            uri,
            headers: headers,
          );
          break;
        case ReqType.post:
          mongoResponse = await post(
            uri,
            headers: headers,
            body: jsonEncode(body),
          );
          break;
        case ReqType.put:
          mongoResponse = await put(
            uri,
            headers: headers,
            body: jsonEncode(body),
          );
          break;
        case ReqType.delete:
          mongoResponse = await delete(uri, headers: headers);
          break;
        case ReqType.file:
          MultipartRequest request = MultipartRequest('POST', uri)
            ..headers.addAll(headers)
            ..files.add(
              MultipartFile.fromBytes('file', bytes!),
            );
          final streamedResponse = await request.send();
          mongoResponse = Response(
            await streamedResponse.stream.bytesToString(),
            streamedResponse.statusCode,
            request: streamedResponse.request,
            reasonPhrase: streamedResponse.reasonPhrase,
          );
          break;
      }

      returnResponse = await _handleRequest(mongoResponse);
    } catch (error, stack) {
      if (error.runtimeType is SocketException) {
        ConnectivityService.i.updateStatus(isConnected: false);
      }

      if (!kIsWeb && kDebugMode) errorLog('Error on \n >> $uri');

      debugPrint(error.toString());
      debugPrintStack(stackTrace: stack);
      returnResponse = ApiResponse<T>(
        error: true,
        statusCode: 0,
        errorMessage: error.toString(),
      );
    } finally {
      if (loader) navigator.hideLoader();
    }
    return returnResponse;
  }

  Future<ApiResponse<T>> _handleRequest<T>(Response response) async {
    if (!kIsWeb && kDebugMode) {
      infoLog(
        'REQUEST\n >> ${response.request}\n'
        'STATUS\n >> ${response.statusCode}\n'
        'BODY\n >> ${response.body}',
      );
    }
    final int code = response.statusCode;
    if (kReleaseMode) {
      if (code == 401) {
        await FirebaseAuth.instance.signOut().whenComplete(() {
          /// Navigate to signIn or onboarding views
        });
      }
      if (code >= 500 && code < 600) {
        await FirebaseCrashlytics.instance.recordError(
          {'body': response.body, 'statusCode': response.statusCode},
          StackTrace.current,
        );
      }
    }
    dynamic dartObj = jsonDecode(response.body);
    late T modelObject;
    switch (T) {

      /// Parse json to models using class type passed down in generic method
      /// ```
      /// case ServicesModel:
      ///   modelObject = ServicesModel.fromMap(dartObj) as T;
      ///   break;
      /// ```
      ///
      /// And by default the object will be parsed as T
      default:
        modelObject = dartObj as T;
        break;
    }
    return ApiResponse<T>(
      statusCode: code,
      body: modelObject,
    );
  }
}
