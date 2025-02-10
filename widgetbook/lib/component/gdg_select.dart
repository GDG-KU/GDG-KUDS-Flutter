import 'package:flutter/material.dart';
import 'package:gdgku_design/ui/component/gdg_select.dart';
import 'package:gdgku_design/ui/theme/gdg_color_scheme.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/knob/color_knob.dart';

@widgetbook.UseCase(name: 'Default', type: GdgSelect)
Widget buildNewWidgetUseCase(BuildContext context) {
  final hintText = context.knobs.string(
    label: 'hintText',
    initialValue: 'Select',
  );
  final optionsLength = context.knobs.int.slider(
    label: 'length of options',
    initialValue: 3,
    min: 1,
    max: 10,
  );
  final color = context.knobs.gdgColor(label: "color");
  return Padding(
    padding: const EdgeInsets.all(17.0),
    child: Center(
      child: SizedBox(
        width: 300,
        child: _GdgSelect(optionsLength, hintText, color),
      ),
    ),
  );
}

class _GdgSelect extends StatefulWidget {
  const _GdgSelect(this.length, this.hintText, this.color);

  final int length;
  final String hintText;
  final GdgColor color;

  @override
  State<_GdgSelect> createState() => _GdgSelectState();
}

class _GdgSelectState extends State<_GdgSelect> {
  String? value;

  @override
  Widget build(BuildContext context) {
    return GdgSelect<String>(
      value: value,
      options: List.generate(widget.length, (index) => 'Option $index'),
      color: widget.color,
      hintText: widget.hintText,
      onChanged: (String? newValue) {
        setState(() {
          value = newValue;
        });
      },
    );
  }
}
