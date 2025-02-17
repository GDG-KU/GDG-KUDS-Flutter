import 'package:flutter/material.dart';
import 'package:gdgku_design/gdgku_design.dart';

import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/knob/color_knob.dart';

@widgetbook.UseCase(name: 'Default', type: GdgCheckbox)
Widget buildNewWidgetUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(17.0),
    child: Center(
      child: CheckBoxTester(),
    ),
  );
}

class CheckBoxTester extends StatefulWidget {
  const CheckBoxTester({super.key});

  @override
  State<CheckBoxTester> createState() => _GdgCheckboxState();
}

class _GdgCheckboxState extends State<CheckBoxTester> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return GdgCheckbox(
      onChanged: context.knobs.boolean(label: "enabled", initialValue: true)
          ? (v) {
              setState(() {
                value = v;
              });
            }
          : null,
      color: context.knobs.gdgColor(label: "color"),
      value: value,
    );
  }
}
