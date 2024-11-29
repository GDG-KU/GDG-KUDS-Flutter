import 'package:flutter/material.dart';
import 'package:gdg_dsgn/ui/component/gdg_button.dart';
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
        body: Center(
          child: GdgButton(
            onPressed: () {},
            // icon: const Icon(Icons.share, size: 20),
            child: const Text('Click Here!'),
            // child: const Icon(Icons.share, size: 20),
          ),
        ),
      ),
    );
  }
}
