import 'package:teniyo/src/property/alignment.dart';
import 'package:teniyo/src/lib/css.dart';
import 'package:teniyo/src/lib/html.dart';
import 'package:teniyo/src/property/widget.dart';

class Align extends Widget{
  final Widget child;
  final Alignment alignment;

  Align({
    required this.child,
    this.alignment = Alignment.center,
  });

  @override
  build(){
    return Html(
      tag: "div",
      style: Style({
        "height": "100%",
        "width": "100%",
      }),
      attributes: {
        "class": "align"
      },
      children: Html(
        tag: "div",
        style: Style({
          "top": alignment==Alignment.topCenter || alignment==Alignment.topLeft || alignment==Alignment.topRight ? "0" : alignment==Alignment.centerLeft || alignment==Alignment.centerRight || alignment==Alignment.center? "50%" : "auto",
          "left": alignment==Alignment.topLeft || alignment==Alignment.centerLeft || alignment==Alignment.bottomLeft ? "0" : alignment==Alignment.topCenter || alignment==Alignment.bottomCenter || alignment==Alignment.center ? "50%" : "auto",
          "right": alignment==Alignment.topRight || alignment==Alignment.centerRight || alignment==Alignment.bottomRight ? "0" : "auto",
          "bottom": alignment==Alignment.bottomCenter || alignment==Alignment.bottomLeft || alignment==Alignment.bottomRight ? "0" : "auto",
          "transform": alignment==Alignment.bottomLeft || alignment==Alignment.bottomRight || alignment==Alignment.topLeft || alignment==Alignment.topRight? "translate(0%, 0%)":
            alignment==Alignment.topCenter || alignment==Alignment.bottomCenter? "translate(-50%, 0%)":
            alignment==Alignment.centerLeft || alignment==Alignment.centerRight? "translate(0%, -50%)":
            "translate(-50%, -50%)",
          "position": "absolute",
        }),
        children: child.build(),
      )
    );
  }
}