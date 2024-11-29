import 'package:flutter/material.dart';
import 'package:gdg_dsgn/ui/theme/data.dart';

class GdgTheme extends StatelessWidget {
  const GdgTheme({
    super.key,
    required this.data,
    required this.child,
  });

  final GdgThemeData data;
  final Widget child;

  static GdgThemeData of(BuildContext context) {
    return maybeOf(context)!;
  }

  static GdgThemeData? maybeOf(BuildContext context) {
    final provider =
        context.getElementForInheritedWidgetOfExactType<GdgInheritedTheme>();
    return (provider as GdgInheritedTheme?)?.theme.data;
  }

  @override
  Widget build(BuildContext context) {
    return GdgInheritedTheme(theme: this, child: child);
  }
}

class GdgInheritedTheme extends InheritedTheme {
  const GdgInheritedTheme({
    super.key,
    required super.child,
    required this.theme,
  });

  final GdgTheme theme;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return GdgTheme(data: theme.data, child: child);
  }

  @override
  bool updateShouldNotify(GdgInheritedTheme oldWidget) =>
      theme.data != oldWidget.theme.data;
}
