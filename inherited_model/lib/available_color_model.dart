import 'package:flutter/material.dart';
import 'package:inherited_model/available_colors.dart';
import 'extensions.dart';

class AvailableColorsModel extends InheritedModel<AvailableColors> {
  final MaterialColor color1;
  final MaterialColor color2;

  const AvailableColorsModel(
      {Key? key,
      required this.color1,
      required this.color2,
      required Widget child})
      : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(covariant AvailableColorsModel oldWidget) {
    'update should notify'.log();
    return color1 != oldWidget.color1 || color2 != oldWidget.color2;
  }

  @override
  bool updateShouldNotifyDependent(covariant AvailableColorsModel oldWidget,
      Set<AvailableColors> dependencies) {
    'Update should notify dependent'.log();
    if (dependencies.contains(AvailableColors.one) &&
        oldWidget.color1 != color1) return true;
    if (dependencies.contains(AvailableColors.two) &&
        oldWidget.color2 != color2) return true;

    return false;
  }

  static AvailableColorsModel of(
          BuildContext context, AvailableColors aspect) =>
      InheritedModel.inheritFrom<AvailableColorsModel>(
        context,
        aspect: aspect,
      )!;
}
