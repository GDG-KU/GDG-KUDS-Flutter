import 'package:flutter/material.dart';
import 'package:gdgku_design/gdgku_design.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: GdgTypographyView)
Widget buildGdgTypographyUseCase(BuildContext context) {
  return GdgTypographyView(
    text: context.knobs.string(
      label: 'Text',
      initialValue: 'Hello, World!',
    ),
  );
}
