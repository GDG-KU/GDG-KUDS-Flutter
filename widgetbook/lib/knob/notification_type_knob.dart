import 'package:gdgku_design/gdgku_design.dart';
import 'package:widgetbook/widgetbook.dart';

extension NotificationTypeKnobBuilder on KnobsBuilder {
  GdgNotificationVariant gdgNotificationType({
    required String label,
    GdgNotificationVariant initialValue = GdgNotificationVariant.primary,
  }) =>
      onKnobAdded(
        NotificationTypeKnob(
          label: label,
          initialValue: initialValue,
        ),
      )!;
}

class NotificationTypeKnob extends Knob<GdgNotificationVariant> {
  NotificationTypeKnob({
    required super.label,
    required super.initialValue,
  });

  @override
  List<Field> get fields => [
        ListField<String>(
          name: "notification_type",
          values: [
            "normal",
            "info",
            "success",
            "warning",
            "error",
          ],
          initialValue: "normal",
        ),
      ];

  @override
  GdgNotificationVariant valueFromQueryGroup(Map<String, String> group) {
    return switch (group["notification_type"]) {
      "normal" => GdgNotificationVariant.primary,
      "error" => GdgNotificationVariant.error,
      "success" => GdgNotificationVariant.success,
      "warning" => GdgNotificationVariant.warning,
      "info" => GdgNotificationVariant.info,
      _ => GdgNotificationVariant.primary,
    };
  }
}
