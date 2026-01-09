import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mycampusinfo_app/core/common/shortlist_notification_provider.dart';
import 'package:mycampusinfo_app/core/notifications/notification_service.dart';
import 'package:mycampusinfo_app/core/services/service_locator.dart';
import 'package:mycampusinfo_app/core/services/shared_pref_helper.dart';
import 'package:mycampusinfo_app/firebase_options_prod.dart' as prod;
import 'package:mycampusinfo_app/firebase_options_stage.dart' as stage;
import 'package:provider/provider.dart';

import 'app.dart';

enum Flavor { stage, prod }

Future<void> bootstrap(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  await _init(flavor);
  await SharedPrefHelper.init();
  await NotificationService().init();
  initServiceLocator();
  await getIt.allReady();
final Widget wrappedApp = MultiProvider(
    providers: [
      // Add any other existing providers here
      // For example: ChangeNotifierProvider(create: (_) => AppStateProvider()),
      ChangeNotifierProvider(create: (_) => ShortlistNotificationProvider()),
    ],
    child: const App(),
  );

  if (kIsWeb) {
    runApp(
      // 4. Use the wrappedApp in DevicePreview
      DevicePreview(builder: (context) => wrappedApp),
    );
  } else {
    // 5. Use the wrappedApp for mobile
    runApp(wrappedApp);
  }
}

Future<void> _init(Flavor flavor) async {
  try {
    await Firebase.initializeApp(
      options: flavor == Flavor.stage
          ? stage.DefaultFirebaseOptions.currentPlatform
          : prod.DefaultFirebaseOptions.currentPlatform,
    );
  } finally {
    // Initialize other dependencies here if needed
  }
}
