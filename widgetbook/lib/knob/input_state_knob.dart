import 'package:gdg_dsgn/ui/component/gdg_input.dart';
import 'package:widgetbook/widgetbook.dart';

extension InputStateKnobBuilder on KnobsBuilder {
  GdgInputState gdgInpuState({
    required String label,
    GdgInputState initialValue = GdgInputState.normal,
  }) =>
      onKnobAdded(
        InputStateKnob(
          label: label,
          initialValue: initialValue,
        ),
      )!;
}

class InputStateKnob extends Knob<GdgInputState> {
  InputStateKnob({
    required super.label,
    required super.initialValue,
  });

  @override
  List<Field> get fields => [
        ListField<String>(
          name: "input_state",
          values: [
            "normal",
            "success",
            "error",
          ],
          initialValue: "normal",
        ),
      ];

  @override
  GdgInputState valueFromQueryGroup(Map<String, String> group) {
    return switch (group["input_state"]) {
      "normal" => GdgInputState.normal,
      "error" => GdgInputState.error,
      "success" => GdgInputState.success,
      _ => GdgInputState.normal,
    };
  }
}
