import 'package:teniyo/src/lib/css.dart';
import 'package:teniyo/src/lib/html.dart';
import 'package:teniyo/src/property/widget.dart';

class Stack extends Widget{
  final List<Widget> children;

  Stack({required this.children});

  @override
  build(){
    return Html(
      tag: "div",
      style: Style({
        "position": "relative",
        "height": "100%",
      }),
      children: children.map((e){
        Html child = e.build();

        child.style.set("position", "absolute");
          
        return child;
      }).toList()
    );
  }
}