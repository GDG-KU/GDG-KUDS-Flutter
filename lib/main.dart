import 'package:flutter/material.dart';
import 'package:gdgku_design/ui/component/gdg_select.dart';
import 'package:gdgku_design/ui/example/gdg_example.dart';
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
      home: const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: GdgSelect(
            width: 200,
            options: [
              Text("data1"),
              Text("data2"),
              Text("data3"),
            ],
          ),
        ),
      ),
    );
  }
}
