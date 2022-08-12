import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:singleton_pattern/config/api_config.dart';
import 'package:singleton_pattern/utilities/core.dart';

late AndroidNotificationChannel channel;

late FlutterLocalNotificationsPlugin localNotifPlugin;

class FirebaseConfig {
  FirebaseConfig._();

  static Future<void> _fcmMessageHandler(RemoteMessage message) async {
    debugPrint(message.toString());

    /// Do your thing
  }

  static Future<void> init() async {
    final options = DefaultFirebaseOptions.currentPlatform;
    final siteId = ApiConfig.i.recaptchaSiteId;
    await Firebase.initializeApp(options: options);
    FirebaseMessaging.onBackgroundMessage(_fcmMessageHandler);
    if (ApiConfig.i.isLocalEnv) {
      final host = ApiConfig.i.baseUrl;
      await FirebaseAuth.instance.useAuthEmulator(host, 9099);
      await FirebaseStorage.instance.useStorageEmulator(host, 9199);
      FirebaseFirestore.instance.useFirestoreEmulator(host, 8080);
    }
    await FirebaseAppCheck.instance.activate(webRecaptchaSiteKey: siteId);
    await FirebaseAppCheck.instance.setTokenAutoRefreshEnabled(true);
    if (!kIsWeb) {
      localNotifPlugin = FlutterLocalNotificationsPlugin();
      const String groupId = 'easer_high_importance_channel';
      const String title = 'High Importance Notifications For Easer App';
      const String description =
          'This channel is used for important notifications by Easer App.';
      channel = AndroidNotificationChannel(
        10.randomInt(), // id
        title,
        description: description,
        groupId: groupId,
      );

      /// Create an Android Notification Channel.
      ///
      /// We use this channel in the `AndroidManifest.xml` file to override the
      /// default FCM channel to enable heads up notifications.
      await localNotifPlugin
          .resolvePlatformSpecificImplementation<AFLNP>()
          ?.createNotificationChannel(channel);

      /// Update the iOS foreground notification presentation options to allow
      /// heads up notifications.
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }
}
