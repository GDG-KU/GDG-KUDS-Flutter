import 'package:flutter/material.dart';
import 'package:gdgku_design/gdgku_design.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:widgetbook_workspace/knob/color_knob.dart';

@widgetbook.UseCase(name: 'Default', type: GdgTextarea)
Widget buildNewWidgetUseCase(BuildContext context) {
  return Center(
    child: Container(
      constraints: const BoxConstraints(maxWidth: 400),
      child: GdgTextarea(
        enabled: context.knobs.boolean(label: "enabled", initialValue: true),
        scrollBarVisiblity: context.knobs.boolean(
          label: "scrollBarVisiblity",
          initialValue: true,
        ),
        label: context.knobs.string(label: "label", initialValue: "Label"),
        maxLines: context.knobs.int.slider(
          label: "maxLines",
          min: 3,
          max: 10,
          initialValue: 5,
        ),
        cursorColor: context.knobs.gdgColor(label: "cursorColor"),
        decoration: InputDecoration(
          hintText: context.knobs
              .string(label: "hintText", initialValue: "Hint Text"),
        ),
      ),
    ),
  );
}
