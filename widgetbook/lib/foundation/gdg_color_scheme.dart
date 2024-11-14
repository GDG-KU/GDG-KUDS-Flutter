import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:gdg_dsgn/ui/foundation/gdg_color_scheme.dart';

@widgetbook.UseCase(name: 'Default', type: GdgColorScheme)
Widget buildGdgTypographyUseCase(BuildContext context) {
  return const GdgColorScheme();
}
