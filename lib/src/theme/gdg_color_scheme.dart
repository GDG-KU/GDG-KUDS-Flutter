part of '../../gdgku_design.dart';

@immutable
class GdgColorScheme {
  final Color background;
  final Color foreground;

  const GdgColorScheme({
    required this.background,
    required this.foreground,
  });

  static GdgColorScheme get defaultColorScheme {
    return GdgColorScheme(
      background: GdgColors.primary,
      foreground: GdgColors.primary.shade100,
    );
  }
}

abstract final class GdgColors {
  static const int _primaryValue = 0xFF000000;
  static const int _redPrimaryValue = 0xFFEA4336;
  static const int _bluePrimaryValue = 0xFF4285F4;
  static const int _greenPrimaryValue = 0xFF34A853;
  static const int _yellowPrimaryValue = 0xFFFAAB00;
  static const GdgColor primary = GdgColor(
    _primaryValue,
    <int, Color>{
      100: Color(0xFFFFFFFF),
      200: Color(0xFFF1F3F4),
      300: Color(0xFFE1E2E4),
      400: Color(0xFFC5C5C5),
      500: Color(0xFFADADAD),
      600: Color(0xFF5F6367),
      700: Color(0xFF43474B),
      800: Color(0xFF101010),
      900: Color(_primaryValue),
    },
  );
  static const GdgColor red = GdgColor(
    _redPrimaryValue,
    <int, Color>{
      100: Color(0xFFFFCDD2),
      300: Color(0xFFE57373),
      500: Color(_redPrimaryValue),
    },
  );
  static const GdgColor blue = GdgColor(
    _bluePrimaryValue,
    <int, Color>{
      100: Color(0xFFCADEFF),
      300: Color(0xFF8AB4F7),
      500: Color(_bluePrimaryValue),
    },
  );
  static const GdgColor green = GdgColor(
    _greenPrimaryValue,
    <int, Color>{
      100: Color(0xFFB2E4C0),
      300: Color(0xFF81C995),
      500: Color(_greenPrimaryValue),
    },
  );
  static const GdgColor yellow = GdgColor(
    _yellowPrimaryValue,
    <int, Color>{
      100: Color(0xFFFFEFC3),
      300: Color(0xFFFEE293),
      500: Color(_yellowPrimaryValue),
    },
  );
}

class GdgColor extends ColorSwatch<int> {
  const GdgColor(super.primary, super.swatch);

  Color get shade100 => this[100]!;
  Color get shade200 => this[200]!;
  Color get shade300 => this[300]!;
  Color get shade400 => this[400]!;
  Color get shade500 => this[500]!;
  Color get shade600 => this[600]!;
  Color get shade700 => this[700]!;
  Color get shade800 => this[800]!;
  Color get shade900 => this[900]!;
}
