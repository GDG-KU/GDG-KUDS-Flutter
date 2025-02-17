import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gdgku_design/gdgku_design.dart';

void main() {
  group('GdgColorScheme widget tests', () {
    testWidgets('ListView is rendered', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GdgColorSchemeView(),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Copy icons are present for each color item',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GdgColorSchemeView(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.copy), findsWidgets);
    });
  });
}
