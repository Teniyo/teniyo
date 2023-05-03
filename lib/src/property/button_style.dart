import 'package:teniyo/src/property/border_radius.dart';
import 'package:teniyo/src/property/color.dart';

class ButtonStyle{
  final Color? color,
    disabledColor,
    hoverColor,
    splashColor;

  final BorderRadius borderRadius;

  ButtonStyle({
    this.color,
    this.disabledColor,
    this.hoverColor,
    this.splashColor,
    BorderRadius? borderRadius,
  }):
    borderRadius = borderRadius??BorderRadius.all(20);

}