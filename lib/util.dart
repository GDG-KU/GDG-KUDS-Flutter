import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

extension BuildContextX on BuildContext {
//  TextTheme get getTextTheme => ShadTheme.of(this).textTheme;
//  ColorScheme get getColorScheme => ShadTheme.of(this).colorScheme;
}

extension DoubleX on double {
  double get pxToDP => this / Util.instance.deviceRatio;
}

extension IntX on int {
  double get pxToDP => this / Util.instance.deviceRatio;
}

class Util {
  static Util get instance => GetIt.I<Util>();
  Util(BuildContext context);
  // : deviceRatio = MediaQuery.of(context).devicePixelRatio;

  double deviceRatio = 1.15;
}
