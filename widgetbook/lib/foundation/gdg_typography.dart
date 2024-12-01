import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:gdg_dsgn/ui/foundation/gdg_typography.dart';

@widgetbook.UseCase(name: 'Default', type: GdgTypographyView)
Widget buildGdgTypographyUseCase(BuildContext context) {
  return GdgTypographyView(
    text: context.knobs.string(
      label: 'Text',
      initialValue: 'Hello, World!',
    ),
  );
}
