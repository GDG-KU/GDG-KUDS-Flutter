import 'package:flutter/material.dart';
import 'package:gdgku_design/gdgku_design.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      themeMode: ThemeMode.light,
      addons: [
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
        return GdgTheme(
          data: GdgThemeData(),
          child: child,
        );
      },
    );
  }
}
