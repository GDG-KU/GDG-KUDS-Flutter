import 'package:gdgku_design/ui/theme/gdg_color_scheme.dart';
import 'package:widgetbook/widgetbook.dart';

extension ColorKnobBuilder on KnobsBuilder {
  GdgColor gdgColor({
    required String label,
    GdgColor initialValue = GdgColors.primary,
  }) =>
      onKnobAdded(
        ColorKnob(
          label: label,
          initialValue: initialValue,
        ),
      )!;
}

class ColorKnob extends Knob<GdgColor> {
  ColorKnob({
    required super.label,
    required super.initialValue,
  });

  @override
  List<Field> get fields => [
        ListField<String>(
          name: "color_scheme",
          values: [
            "primary",
            "red",
            "blue",
            "green",
            "yellow",
          ],
          initialValue: "primary",
        ),
      ];

  @override
  GdgColor valueFromQueryGroup(Map<String, String> group) {
    return switch (group["color_scheme"]) {
      "primary" => GdgColors.primary,
      "red" => GdgColors.red,
      "blue" => GdgColors.blue,
      "yellow" => GdgColors.yellow,
      "green" => GdgColors.green,
      _ => GdgColors.primary,
    };
  }
}
