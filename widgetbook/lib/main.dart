import 'package:flutter/material.dart';
import 'package:gdg_dsgn/ui/theme/color_scheme.dart';
import 'package:gdg_dsgn/util.dart';
import 'package:get_it/get_it.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatefulWidget {
  const WidgetbookApp({super.key});

  @override
  State<WidgetbookApp> createState() => _WidgetbookAppState();
}

class _WidgetbookAppState extends State<WidgetbookApp> {
  bool isInitialized = false;

  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      GetIt.I.registerSingleton<Util>(Util(context));
      isInitialized = true;
    }
    return Widgetbook(
      directories: directories,
      themeMode: ThemeMode.light,
      addons: [
        TextScaleAddon(),
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhoneSE,
            Devices.ios.iPhone13,
            Devices.android.samsungGalaxyS20,
            Devices.android.smallTablet,
          ],
        ),
      ],
      appBuilder: (context, child) {
        return MaterialApp(
          themeMode: ThemeMode.light,
          theme: ThemeData(
            primaryColor: kColors.primary80,
            iconTheme: const IconThemeData(
              color: kColors.primary10,
            ),
          ),
          home: Scaffold(
            body: child,
          ),
        );
      },
    );
  }
}
