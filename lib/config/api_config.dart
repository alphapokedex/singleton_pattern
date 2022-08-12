import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:singleton_pattern/utilities/core.dart';

class ApiConfig {
  factory ApiConfig() => _singleton;

  ApiConfig._();

  final String basicAuth = base64Encode(
    utf8.encode('<<BASIC-AUTH-USERNAME>>:<<BASIC-AUTH-PASSWORD>>'),
  );

  int? port;
  String scheme = 'https';
  String get googleMapsApiKey => '<<YOUR-GOOGLE-MAP-KEY>>';
  String get recaptchaSiteId => '<<YOUR-RECAPTCHA-SITE-ID>>';
  String? get googleOAuthClientId => kIsWeb ? '<<YOUR-OAUTH-CLIENT-ID>>' : null;

  static final ApiConfig _singleton = ApiConfig._();

  String? _baseUrl;
  final String _developmentBaseUrl = 'easer-dev-api.applore.in';
  bool _isDevEnv = false;
  bool _isLocalEnv = false;
  bool _isProdEnv = false;
  bool _isTestEnv = false;
  final String _productionBaseUrl = 'easer-prod-api.applore.in';

  /// [ApiConfig] singleton instance for public use.
  static ApiConfig get i => _singleton;

  bool get isLocalEnv => _isLocalEnv;

  bool get isProdEnv => _isProdEnv;

  bool get isDevEnv => _isDevEnv;

  bool get isTestEnv => _isTestEnv;

  String get baseUrl => _singleton._baseUrl!;

  Uri get baseUri => Uri(scheme: scheme, host: _baseUrl, port: port);

  void init({required Flavour flavour}) {
    switch (flavour) {
      case Flavour.dev:
        _isDevEnv = true;
        _baseUrl = _developmentBaseUrl;
        break;
      case Flavour.prod:
        _isProdEnv = true;
        _baseUrl = _productionBaseUrl;
        break;
      case Flavour.test:
        _isTestEnv = true;
        _baseUrl = _developmentBaseUrl;
        break;
      case Flavour.local:
        _isLocalEnv = true;
        _baseUrl = kIsWeb
            ? 'localhost'
            : Platform.isAndroid
                ? '10.0.2.2'
                : 'localhost';
        port = 8000;
        scheme = 'http';
        break;
    }
  }
}
