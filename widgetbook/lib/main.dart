import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
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
        ThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: ShadThemeData(
                colorScheme: ShadColorScheme.fromName('slate'),
                brightness: Brightness.light,
              ),
            ),
          ],
          themeBuilder: (context, theme, child) {
            return ShadTheme(
              data: theme,
              child: child,
            );
          },
        ),
      ],
      appBuilder: (context, child) {
        return child;
      },
    );
  }
}
