import 'package:flutter/material.dart';

import 'package:gdgku_design/ui/theme/data.dart';
import 'package:gdgku_design/ui/theme/gdg_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isInitialized = false;

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return GdgTheme(
          data: GdgThemeData(),
          child: child!,
        );
      },
      home: const Scaffold(backgroundColor: Colors.white),
    );
  }
}
