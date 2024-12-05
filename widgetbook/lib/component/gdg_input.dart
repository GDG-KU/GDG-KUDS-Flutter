import 'package:flutter/material.dart';
import 'package:gdg_dsgn/ui/component/gdg_input.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/knob/icon_knob.dart';
import 'package:widgetbook_workspace/knob/input_state_knob.dart';

@widgetbook.UseCase(name: 'Default', type: GdgInput)
Widget buildNewWidgetUseCase(BuildContext context) {
  final isSmall = context.knobs.boolean(label: "is_small", initialValue: false);
  final label = context.knobs.string(label: "label", initialValue: "Label");
  final helpText = context.knobs.string(
    label: "helpText",
    initialValue: "Help Text",
  );

  final state = context.knobs.gdgInpuState(
    label: "state",
    initialValue: GdgInputState.normal,
  );
  // final prefixIcon = context.knobs.iconData(
  //   label: "prefixIcon",
  //   initialValue: Icons.person,
  // );
  // final suffixIcon = context.knobs.iconData(
  //   label: "suffixIcon",
  //   initialValue: Icons.person,
  // );
  final isObscure = context.knobs.boolean(
    label: "is_obscure",
    initialValue: false,
  );

  return Padding(
    padding: const EdgeInsets.all(17.0),
    child: Center(
      child: SizedBox(
        width: isSmall ? 200 : 240,
        child: isSmall
            ? GdgInput.small(
                label: label,
                helpText: helpText,
                // prefix: prefixIcon,
                // suffix: suffixIcon,
                obscureText: isObscure,
                state: state,
              )
            : GdgInput.medium(
                label: label,
                helpText: helpText,
                // prefix: prefixIcon,
                // suffix: suffixIcon,
                obscureText: isObscure,
                state: state,
              ),
      ),
    ),
  );
}
