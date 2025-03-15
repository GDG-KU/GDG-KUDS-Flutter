import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gdgku_design/gdgku_design.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/knob/notification_type_knob.dart';

@widgetbook.UseCase(name: 'Default', type: GdgNotification)
Widget buildNewWidgetUseCase(BuildContext context) {
  final titleText = context.knobs.string(
    label: "title",
    initialValue: "Modal title",
  );
  final descriptionText = context.knobs.string(
    label: "description",
    initialValue: "Modal description",
  );
  final isFilled = context.knobs.boolean(
    label: 'isFilled',
    initialValue: false,
  );
  final type = context.knobs.gdgNotificationType(
    label: 'Type',
    initialValue: GdgNotificationVariant.primary,
  );

  log(type.toString());

  return Center(
    child: GdgButton(
      onPressed: () => showGdgNotification(
        context: context,
        builder: (context) => GdgNotification(
          isFilled: isFilled,
          variant: type,
          title: titleText,
          content: Text(descriptionText),
        ),
      ),
      child: const Text('Show me!'),
    ),
  );
}
