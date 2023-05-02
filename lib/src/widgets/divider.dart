import 'package:teniyo/src/property/axis.dart';
import 'package:teniyo/src/lib/html.dart';
import 'package:teniyo/src/property/text_align.dart';
import 'package:teniyo/src/property/widget.dart';

class Divider extends Widget{
  final Widget? child;
  final TextAlign? textAlign;
  final Axis axis;

  Divider({
    this.child,
    this.textAlign,
    this.axis = Axis.horizontal,
  });

  @override
  build(){
    return Html(
      tag: "Divider",
      key: key,
      children: child?.build(),
      attributes: {
        "orientation": axis==Axis.horizontal ? "horizontal" : "vertical",
        "textAlign": textAlign==TextAlign.center ? "center":
          textAlign==TextAlign.justify ? "justify":
          textAlign==TextAlign.left ? "left":
          textAlign==TextAlign.right ? "right":null,
      },
    );
  }
}