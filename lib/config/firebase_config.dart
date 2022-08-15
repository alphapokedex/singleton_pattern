import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:singleton_pattern/config/api_config.dart';
import 'package:singleton_pattern/utilities/core.dart';

/// Firebase related configurations
class FirebaseConfig {
  FirebaseConfig._();

  static Future<void> _fcmMessageHandler(RemoteMessage message) async {
    debugPrint(message.toString());

    /// Do your thing
  }

  static Future<void> setupNotifications() async {
    final plugin = FlutterLocalNotificationsPlugin();
    const String id = 'easer_high_importance_channel';
    const String title = 'High Importance Notifications For Easer App';
    const String desc =
        'This channel is used for important notifications by Easer App.';
    const channel = AndroidNotificationChannel(id, title, description: desc);

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    final platform = plugin.resolvePlatformSpecificImplementation;
    await platform<AFLNP>()?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    final fmi = FirebaseMessaging.instance;
    final iosSetup = fmi.setForegroundNotificationPresentationOptions;
    await iosSetup(alert: true, badge: true, sound: true);
  }

  static Future<void> init() async {
    /// TODO: uncomment after adding firebase to your project using
    /// [FlutterFire CLI] using following commands
    /// ```
    /// flutterfire configure --project=<<PROJECT-ID>>
    /// ```
    /// node.js and firebase-tools module via npm or standalone cli
    /// for firebase tools should be pre-installed
    /// checkout https://firebase.flutter.dev/docs/cli/ for more info
    // final options = DefaultFirebaseOptions.currentPlatform;
    /// TODO: uncomment after adding firbase to your project
    // await Firebase.initializeApp(options: options);

    /// Handler for background message services
    FirebaseMessaging.onBackgroundMessage(_fcmMessageHandler);

    /// Enables necessary notification settings in Mobile platforms
    if (!kIsWeb) await setupNotifications();

    /// If local env then flutter emulators will be used at default port values
    if (ApiConfig.i.isLocalEnv) {
      final host = ApiConfig.i.baseUrl;
      await FirebaseAuth.instance.useAuthEmulator(host, 9099);
      await FirebaseStorage.instance.useStorageEmulator(host, 9199);
      FirebaseFirestore.instance.useFirestoreEmulator(host, 8080);
    }

    /// App check activation and token auto refesh enabled
    /// pass [siteId] in case of web platform only
    final siteId = ApiConfig.i.recaptchaSiteId;
    await FirebaseAppCheck.instance.activate(webRecaptchaSiteKey: siteId);
    await FirebaseAppCheck.instance.setTokenAutoRefreshEnabled(true);
  }
}
