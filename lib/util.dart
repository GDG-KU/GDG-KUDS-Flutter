import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

extension BuildContextX on BuildContext {
  ShadTextTheme get getTextTheme => ShadTheme.of(this).textTheme;
  ShadColorScheme get getColorScheme => ShadTheme.of(this).colorScheme;
}
