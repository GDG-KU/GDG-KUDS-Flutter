import 'package:flutter/material.dart';
import 'package:gdg_dsgn/ui/component/gdg_checkbox.dart';
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GdgCheckbox(
                value: isChecked,
                onChanged: null,
                // onChanged: (value) {
                //   setState(() {
                //     isChecked = value!;
                //   });
                // },
                // color: GdgColors.red,
              ),
              const Text(
                "약관 동의?",
                style: TextStyle(
                  inherit: false,
                  fontSize: 12.2,
                  height: 22 / 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                  fontFamily: "pretendard",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
