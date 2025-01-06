import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_planning/core/providers/provider.dart';
import 'package:trip_planning/firebase_options.dart';

import 'core/routes/routes.dart';
import 'core/routes/routes_name.dart';
import 'core/theme.dart';
import 'device_preview_button.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      backgroundColor: Colors.white,
      tools: const [
        CustomPlugin(
          apkDownloadUrl: "",
          sourceCodeUrl: "",
        ),
        DeviceSection(
          frameVisibility: true,
          orientation: false,
        ),
        SystemSection(
          locale: false,
          theme: true,
        ),
        DevicePreviewScreenshot(),
        SettingsSection(
          backgroundTheme: true,
          toolsTheme: true,
        ),
      ],
      devices: [
        Devices.android.samsungGalaxyA50,
        Devices.android.samsungGalaxyNote20,
        Devices.android.samsungGalaxyS20,
        Devices.android.samsungGalaxyNote20Ultra,
        Devices.android.onePlus8Pro,
        Devices.android.sonyXperia1II,
        Devices.ios.iPhoneSE,
        Devices.ios.iPhone12,
        Devices.ios.iPhone12Mini,
        Devices.ios.iPhone12ProMax,
        Devices.ios.iPhone13,
        Devices.ios.iPhone13ProMax,
        Devices.ios.iPhone13Mini,
        Devices.ios.iPhoneSE,
      ],
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: RoutesName.loginView,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
