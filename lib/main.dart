import 'package:flutter/material.dart';
import 'package:gdg_dsgn/ui/component/gdg_button.dart';
import 'package:gdg_dsgn/ui/theme/color_scheme.dart';
import 'package:gdg_dsgn/util.dart';
import 'package:get_it/get_it.dart';

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
    if (!isInitialized) {
      GetIt.I.registerSingleton<Util>(Util(context));
      isInitialized = true;
    }

    return MaterialApp(
      home: Scaffold(
        body: Theme(
          data: ThemeData(
            primaryColor: kColors.primary80,
            iconTheme: const IconThemeData(
              color: kColors.primary10,
            ),
          ),
          child: Center(
            child: GdgButton(
              onPressed: () {},
              // icon: const Icon(Icons.share),
              // child: const Text('Share'),
              child: Icon(Icons.check, color: Colors.green),

              // child: Text(
              //   'Share',
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 16.pxToDP,
              //   ),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
