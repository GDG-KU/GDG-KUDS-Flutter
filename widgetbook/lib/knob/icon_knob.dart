import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

extension IconKnobBuilder on KnobsBuilder {
  IconData? iconData({
    required String label,
    IconData? initialValue,
  }) =>
      onKnobAdded(
        IconKnob(
          label: label,
          initialValue: initialValue,
        ),
      )!;
}

class IconKnob extends Knob<IconData?> {
  IconKnob({
    required super.label,
    required super.initialValue,
  });

  @override
  List<Field> get fields => [
        ListField<String>(
          name: "iconData",
          values: [
            "none",
            "share",
            "add",
            "favorite",
            "download",
          ],
          initialValue: "none",
        ),
      ];

  @override
  IconData? valueFromQueryGroup(Map<String, String> group) {
    return switch (group["iconData"]) {
      "share" => Icons.share,
      "add" => Icons.add,
      "favorite" => Icons.favorite,
      "download" => Icons.download,
      "none" => null,
      _ => Icons.share,
    };
  }
}
