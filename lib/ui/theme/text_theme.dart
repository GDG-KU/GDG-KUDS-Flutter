import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

@immutable
class GdgTextTheme {
  const GdgTextTheme({
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.h5,
    required this.body1Medium,
    required this.body2Medium,
    required this.linkMedium,
    required this.linkSmall,
    required this.body1Small,
    required this.body2Small,
    required this.label1,
    required this.label2,
  });
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;
  final TextStyle h5;
  final TextStyle body1Medium;
  final TextStyle body2Medium;
  final TextStyle linkMedium;
  final TextStyle linkSmall;
  final TextStyle body1Small;
  final TextStyle body2Small;
  final TextStyle label1;
  final TextStyle label2;

  static GdgTextTheme get defaultTextTheme {
    const defaultFontFamily = "Pretendard";
    const black90 = Color(0xE6000000);
    const black85 = Color(0xD9000000);

    return const GdgTextTheme(
      h1: TextStyle(
        inherit: false,
        fontSize: 48,
        height: 68 / 56,
        fontWeight: FontWeight.bold,
        color: black90,
        fontFamily: defaultFontFamily,
      ),
      h2: TextStyle(
        inherit: false,
        fontSize: 35,
        height: 52 / 40,
        fontWeight: FontWeight.bold,
        color: black90,
        fontFamily: defaultFontFamily,
      ),
      h3: TextStyle(
        inherit: false,
        fontSize: 28,
        height: 44 / 32,
        fontWeight: FontWeight.bold,
        color: black90,
        fontFamily: defaultFontFamily,
      ),
      h4: TextStyle(
        inherit: false,
        fontSize: 21,
        height: 34 / 24,
        fontWeight: FontWeight.bold,
        color: black90,
        fontFamily: defaultFontFamily,
      ),
      h5: TextStyle(
        inherit: false,
        fontSize: 17,
        height: 28 / 20,
        fontWeight: FontWeight.bold,
        color: black90,
        fontFamily: defaultFontFamily,
      ),
      body1Medium: TextStyle(
        inherit: false,
        fontSize: 14,
        height: 24 / 16,
        fontWeight: FontWeight.w500,
        color: black85,
        fontFamily: defaultFontFamily,
      ),
      body2Medium: TextStyle(
        inherit: false,
        fontSize: 14,
        height: 24 / 16,
        fontWeight: FontWeight.normal,
        color: black85,
        fontFamily: defaultFontFamily,
      ),
      linkMedium: TextStyle(
        inherit: false,
        fontSize: 14,
        height: 24 / 16,
        fontWeight: FontWeight.w500,
        color: black85,
        fontFamily: defaultFontFamily,
        decoration: TextDecoration.underline,
      ),
      body1Small: TextStyle(
        inherit: false,
        fontSize: 12.2,
        height: 22 / 14,
        fontWeight: FontWeight.w500,
        color: black85,
        fontFamily: defaultFontFamily,
      ),
      body2Small: TextStyle(
        inherit: false,
        fontSize: 12.2,
        height: 22 / 14,
        fontWeight: FontWeight.normal,
        color: black85,
        fontFamily: defaultFontFamily,
      ),
      linkSmall: TextStyle(
        inherit: false,
        fontSize: 12.2,
        height: 22 / 14,
        fontWeight: FontWeight.w500,
        color: black85,
        fontFamily: defaultFontFamily,
        decoration: TextDecoration.underline,
      ),
      label1: TextStyle(
        inherit: false,
        fontSize: 11,
        height: 18 / 12,
        fontWeight: FontWeight.bold,
        color: black85,
        fontFamily: defaultFontFamily,
      ),
      label2: TextStyle(
        inherit: false,
        fontSize: 11,
        height: 18 / 12,
        fontWeight: FontWeight.w500,
        color: black85,
        fontFamily: defaultFontFamily,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GdgTextTheme &&
        other.h1 == h1 &&
        other.h2 == h2 &&
        other.h3 == h3 &&
        other.h4 == h4 &&
        other.h5 == h5 &&
        other.body1Medium == body1Medium &&
        other.body2Medium == body2Medium &&
        other.linkMedium == linkMedium &&
        other.linkSmall == linkSmall &&
        other.body1Small == body1Small &&
        other.body2Small == body2Small &&
        other.label1 == label1 &&
        other.label2 == label2;
  }

  @override
  int get hashCode {
    return Object.hash(
      h1,
      h2,
      h3,
      h4,
      h5,
      body1Medium,
      body2Medium,
      linkMedium,
      linkSmall,
      body1Small,
      body2Small,
      label1,
      label2,
    );
  }
}
