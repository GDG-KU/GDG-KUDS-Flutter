import 'package:flutter/material.dart';
import 'package:gdgku_design/gdgku_design.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: GdgColorSchemeView)
Widget buildGdgTypographyUseCase(BuildContext context) {
  return const GdgColorSchemeView();
}
