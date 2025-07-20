import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pening_repository_ngr/core/theme/app_theme.dart';
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'core/routing/go_router.dart';
import 'firebase_options.dart';
import 'screens/auth/providers/auth_provider.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      setUrlStrategy(PathUrlStrategy()); // remove '../#/..' path from url

      if (kIsWeb) {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
      }

      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
          ],
          child: const MyApp(),
        ),
      );
    },
    (err, stack) {
      log("runZonenGuarder Error : $err, $stack");
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'PRN', // Pening Repository NGR
      debugShowCheckedModeBanner: false,
      routerConfig: appRoute,
      theme: appTheme,
    );
  }
}
