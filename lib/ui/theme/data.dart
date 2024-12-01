import 'package:flutter/material.dart';
import 'package:gdg_dsgn/ui/theme/color_scheme.dart';
import 'package:gdg_dsgn/ui/theme/text_theme.dart';

@immutable
class GdgThemeData {
  final GdgColorScheme colorScheme;
  final GdgTextTheme textTheme;

  const GdgThemeData._internal({
    required this.colorScheme,
    required this.textTheme,
  });

  factory GdgThemeData() {
    final effectiveTextTheme = GdgTextTheme.defaultTextTheme;
    final effectiveColorScheme = GdgColorScheme.defaultColorScheme;
    return GdgThemeData._internal(
      colorScheme: effectiveColorScheme,
      textTheme: effectiveTextTheme,
    );
  }

  @override
  int get hashCode => colorScheme.hashCode ^ textTheme.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GdgThemeData &&
        other.colorScheme == colorScheme &&
        other.textTheme == textTheme;
  }
}
