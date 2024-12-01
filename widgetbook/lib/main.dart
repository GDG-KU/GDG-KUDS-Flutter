import 'package:flutter/material.dart';
import 'package:gdg_dsgn/ui/theme/data.dart';
import 'package:gdg_dsgn/ui/theme/theme.dart';
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
  @override
  Widget build(BuildContext context) {
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
          builder: (context, child) {
            return GdgTheme(
              data: GdgThemeData(),
              child: child!,
            );
          },
        );
      },
    );
  }
}
