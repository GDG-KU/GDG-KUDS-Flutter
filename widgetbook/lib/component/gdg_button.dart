import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:gdg_dsgn/ui/component/gdg_button.dart';
import 'package:widgetbook_workspace/knob/color_knob.dart';
import 'package:widgetbook_workspace/knob/icon_knob.dart';

// knob: icon, enabled* , text* , color, isLarge
@widgetbook.UseCase(name: 'Default', type: GdgButton)
Widget buildNewWidgetUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(17.0),
    child: Center(
      child: GdgButton(
        onPressed:
            context.knobs.boolean(label: "is_enabled", initialValue: true)
                ? () {}
                : null,
        icon: Icon(
          context.knobs.iconData(label: "icon"),
          size: 20,
        ),
        color: context.knobs.gdgColor(label: "color"),
        child: Text(
          context.knobs.string(
            label: "text",
            initialValue: "Click Here!",
          ),
        ),
      ),
    ),
  );
}
