import 'package:flutter/material.dart';
import 'package:gdg_dsgn/ui/example/gdg_example.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: GdgExample)
Widget buildNewWidgetUseCase(BuildContext context) {
  return const GdgExample();
}
