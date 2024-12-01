import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:gdg_dsgn/ui/component/gdg_button.dart';

@widgetbook.UseCase(name: 'Default', type: GdgButton)
Widget buildNewWidgetUseCase(BuildContext context) {
  return GdgButton(
      // onPressed: () {},
      // child: const Text("Click!"),
      );
}
