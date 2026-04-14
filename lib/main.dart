import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:morpheme_cached_network_image/morpheme_cached_network_image.dart';
import 'package:morpheme_flutter_lite/app.dart';

// import 'firebase_options.dart';
import 'locator.dart';

Future<void> init() async {
  /// Specifies the `SystemUiMode` to have visible when the application is running.
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
  );

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  MorphemeCachedNetworkImageManager.instance.init();

  setupLocator();
}

void main() async {
  // usePathUrlStrategy();
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await init();

      runApp(const App());
    },
    (error, stack) {
      log(error.toString(), error: error, stackTrace: stack);
      // FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    },
  );
}
