import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:gdg_dsgn/ui/foundation/gdg_color_scheme_view.dart';

@widgetbook.UseCase(name: 'Default', type: GdgColorSchemeView)
Widget buildGdgTypographyUseCase(BuildContext context) {
  return const GdgColorSchemeView();
}
