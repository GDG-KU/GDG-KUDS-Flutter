import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:gdg_dsgn/ui/component/gdg_button.dart';

@widgetbook.UseCase(name: 'Default', type: GdgButton)
Widget buildNewWidgetUseCase(BuildContext context) {
  return Center(
    child: GdgButton(
      onPressed: context.knobs.boolean(label: "enabled", initialValue: true)
          ? () {}
          : null,
      child: Text(
        context.knobs.string(
          label: "text",
          initialValue: "Click Here!",
        ),
      ),
    ),
  );
}
