import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mycampusinfo_app/firebase_options_prod.dart' as prod;
import 'package:mycampusinfo_app/firebase_options_stage.dart' as stage;

import 'app.dart';

enum Flavor { stage, prod }

Future<void> bootstrap(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  await _init(flavor);

  runApp(const App());
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
