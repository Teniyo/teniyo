import 'package:teniyo/src/property/alignment.dart';
import 'package:teniyo/src/property/border_radius.dart';
import 'package:teniyo/src/property/color.dart';
import 'package:teniyo/src/lib/css.dart';
import 'package:teniyo/src/property/edge_insets.dart';
import 'package:teniyo/src/lib/html.dart';
import 'package:teniyo/src/property/widget.dart';

class Container extends Widget{
  final Widget? child;
  final double? width, height;
  final Color? color;
  final EdgeInsets? padding, margin;
  final BorderRadius? borderRadius;
  final Alignment alignment;
  

  Container({
    this.child,
    this.width,
    this.height,
    this.color,
    this.padding,
    this.margin,
    this.borderRadius,
    this.alignment = Alignment.center,
  });

  @override
  Html build(){
    return Html(
      tag: "div",
      key: key,
      style: Style({
        "width": width != null ? "${width}px" : null,
        "height": height != null ? "${height}px" : null,
        "background-color": color != null ? color!.toHex() : null,
        "padding": padding != null ? padding!.render() : null,
        "margin": margin != null ? margin!.render() : null,
        "border-radius": borderRadius != null ? borderRadius!.render() : null,
        "display": "flex",
        "justify-content": alignment.x == 0 ? "center" : alignment.x == -1 ? "flex-start" : "flex-end",
        "align-items": alignment.y == 0 ? "center" : alignment.y == -1 ? "flex-start" : "flex-end",
      }),
      children: child != null ? child!.build() : null,
    );
  }
}