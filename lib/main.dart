import 'package:flutter/material.dart';
import 'package:gdgku_design/gdgku_design.dart';

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
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: GdgTextarea(),
        ),
      ),
    );
  }
}
