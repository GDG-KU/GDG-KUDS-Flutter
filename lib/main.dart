import 'package:flutter/material.dart';
import 'package:gdg_dsgn/ui/foundation/gdg_color_scheme.dart';
import 'package:gdg_dsgn/ui/foundation/gdg_typography.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp(
      theme: ShadThemeData(
        brightness: Brightness.light,
        colorScheme: ShadColorScheme.fromName('slate'),
      ),
      home: const Scaffold(
        body: GdgColorScheme(),
      ),
    );
  }
}
