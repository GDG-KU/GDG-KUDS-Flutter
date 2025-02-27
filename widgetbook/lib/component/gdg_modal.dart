import 'package:flutter/material.dart';
import 'package:gdgku_design/gdgku_design.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: GdgModal)
Widget buildNewWidgetUseCase(BuildContext context) {
  final titleText = context.knobs.string(
    label: "title",
    initialValue: "Modal title",
  );
  final descriptionText = context.knobs.string(
    label: "description",
    initialValue: "Modal description",
  );

  final button1 = GdgButton(
    onPressed: () => showGdgModal(
      context: context,
      builder: (context) => GdgModal.primary(
        title: Text(titleText),
        description: Text(descriptionText, textAlign: TextAlign.center),
        actions: [
          GdgButton(
            onPressed: () {},
            color: GdgColors.red,
            child: const Text('Reject'),
          ),
          GdgButton(
            onPressed: () {},
            child: const Text('Accept'),
          ),
        ],
      ),
    ),
    child: const Text('Small'),
  );

  final button2 = GdgButton(
    onPressed: () => showGdgModal(
      context: context,
      builder: (context) => GdgModal.secondary(
        title: Text(titleText),
        description: Text(
          descriptionText,
          textAlign: TextAlign.center,
        ),
        actions: [
          GdgButton.large(
            onPressed: () {},
            color: GdgColors.red,
            child: const Text('Reject'),
          ),
          GdgButton.large(
            onPressed: () {},
            child: const Text('Accept'),
          ),
        ],
      ),
    ),
    child: const Text('Wide'),
  );

  final button3 = GdgButton(
    onPressed: () => showGdgModal(
      context: context,
      builder: (context) => GdgModal.smallIcon(
        title: Text(titleText),
        description: Text(
          descriptionText,
          textAlign: TextAlign.center,
        ),
        actions: [
          GdgButton(
            onPressed: () {},
            color: GdgColors.red,
            child: const Text('Reject'),
          ),
          GdgButton(
            onPressed: () {},
            child: const Text('Accept'),
          ),
        ],
      ),
    ),
    child: const Text('icon 1'),
  );

  final button4 = GdgButton(
    onPressed: () => showGdgModal(
      context: context,
      builder: (context) => GdgModal.largeIcon(
        title: Text(titleText),
        icon: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amberAccent.withOpacity(0.7),
              ),
            ),
            const DefaultTextStyle(
              style: TextStyle(fontSize: 40),
              child: Text(
                '\u{1F389}',
              ),
            )
          ],
        ),
        actions: [
          GdgButton.large(
            onPressed: () {},
            child: const Text('Accept'),
          ),
        ],
      ),
    ),
    child: const Text('icon 2'),
  );

  final button5 = GdgButton(
    onPressed: () => showGdgModal(
      context: context,
      builder: (context) => GdgModal(
        title: Text(titleText),
        description: Text(
          descriptionText,
          textAlign: TextAlign.center,
        ),
        actions: [
          GdgButton(
            onPressed: () {},
            color: GdgColors.red,
            child: const Text('Reject'),
          ),
          GdgButton(
            onPressed: () {},
            child: const Text('Accept'),
          ),
        ],
        child: const Material(child: GdgInput.medium()),
      ),
    ),
    child: const Text('child'),
  );

  return Center(
    child: SizedBox(
      width: 400,
      height: 600,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [button1, button2, button3, button4, button5],
      ),
    ),
  );
}
