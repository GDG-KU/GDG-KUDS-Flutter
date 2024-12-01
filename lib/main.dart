import 'package:flutter/material.dart';
import 'package:gdg_dsgn/ui/component/gdg_tag.dart';
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
      home: Scaffold(
        body: Center(
          child: GdgTag.medium(
            value: isChecked,
            isFilled: true,
            // color: GdgColors.blue,
            icon: Icons.check,
            onChanged: (value) {
              setState(() {
                isChecked = value;
              });
            },
            child: const Text('GDGasdffds'),
          ),
        ),
      ),
    );
  }
}
