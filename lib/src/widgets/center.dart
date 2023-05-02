import 'package:teniyo/src/lib/css.dart';
import 'package:teniyo/src/lib/html.dart';
import 'package:teniyo/src/property/widget.dart';

class Center extends Widget{
  final Widget child;

  Center({required this.child});

  @override
  build(){
    return Html(
      tag: "div",
      key: key,
      style: Style({
        "display": "flex",
        "align-items": "center",
        "justify-content": "center",
        "align-self": "center",
        "height": "-webkit-fill-available",
      }),
      children: child.build(),
    );
  }
}