import 'package:flutter/material.dart';
import 'package:gdg_dsgn/ui/component/gdg_badge.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/knob/color_knob.dart';

@widgetbook.UseCase(name: 'Default', type: GdgBadge)
Widget buildNewWidgetUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(17.0),
    child: Center(
      child: context.knobs.boolean(label: "is_light", initialValue: false)
          ? GdgBadge.light(
              color: context.knobs.gdgColor(label: "color"),
              child: Text(
                context.knobs.string(
                  label: "text",
                  initialValue: "Label",
                ),
              ),
            )
          : GdgBadge.deep(
              color: context.knobs.gdgColor(label: "color"),
              child: Text(
                context.knobs.string(
                  label: "text",
                  initialValue: "Label",
                ),
              ),
            ),
    ),
  );
}
