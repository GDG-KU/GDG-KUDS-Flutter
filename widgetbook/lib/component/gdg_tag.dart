import 'package:flutter/material.dart';
import 'package:gdgku_design/gdgku_design.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/knob/color_knob.dart';

@widgetbook.UseCase(name: 'Default', type: GdgTag)
Widget buildNewWidgetUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(17.0),
    child: Center(
      child: TagTester(),
    ),
  );
}

class TagTester extends StatefulWidget {
  const TagTester({super.key});

  @override
  State<TagTester> createState() => _GdgCheckboxState();
}

class _GdgCheckboxState extends State<TagTester> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    final isSmall =
        context.knobs.boolean(label: "is_small", initialValue: false);
    final color = context.knobs.gdgColor(label: "color");
    final isFilled =
        context.knobs.boolean(label: "is_filled", initialValue: true);
    final text = context.knobs.string(label: "text", initialValue: "Select");

    if (isSmall) {
      return GdgTag.small(
        value: value,
        color: color,
        isFilled: isFilled,
        onChanged: (v) {
          setState(() {
            value = v;
          });
        },
        child: Text(text),
      );
    }

    return GdgTag.medium(
      value: value,
      color: color,
      isFilled: isFilled,
      onChanged: (v) {
        setState(() {
          value = v;
        });
      },
      child: Text(text),
    );
  }
}
