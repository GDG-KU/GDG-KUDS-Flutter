import 'package:flutter/material.dart';
import 'package:gdg_dsgn/ui/component/gdg_input.dart';
import 'package:gdg_dsgn/ui/example/gdg_example.dart';
import 'package:gdg_dsgn/ui/theme/data.dart';
import 'package:gdg_dsgn/ui/theme/gdg_theme.dart';

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
      home: const Scaffold(
        backgroundColor: Colors.white,
        body: GdgExample(),
      ),
    );
  }
}
