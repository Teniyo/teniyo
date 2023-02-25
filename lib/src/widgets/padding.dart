import 'package:teniyo/src/lib/css.dart';
import 'package:teniyo/src/lib/html.dart';
import 'package:teniyo/src/property/edge_insets.dart';
import 'package:teniyo/src/property/widget.dart';

class Padding extends Widget{
  final Widget child;
  final EdgeInsets padding;

  Padding({required this.child, required this.padding});
  
  @override
  Html build() {
    return Html(
      tag: "div",
      style: Style({
        "margin": padding.render()
      }),
      children: child.build()
    );
  }
}