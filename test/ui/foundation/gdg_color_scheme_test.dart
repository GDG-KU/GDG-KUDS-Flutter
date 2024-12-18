import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gdg_dsgn/ui/foundation/gdg_color_scheme_view.dart';

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
