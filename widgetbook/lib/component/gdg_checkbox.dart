import 'package:flutter/material.dart';
import 'package:gdg_dsgn/ui/component/gdg_checkbox.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/knob/color_knob.dart';

@widgetbook.UseCase(name: 'Default', type: GdgCheckbox)
Widget buildNewWidgetUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(17.0),
    child: Center(
      child: GdgCheckbox(
        onChanged: context.knobs.boolean(label: "enabled", initialValue: true)
            ? (v) {}
            : null,
        color: context.knobs.gdgColor(label: "color"),
        value: context.knobs.boolean(label: "value", initialValue: false),
      ),
    ),
  );
}
