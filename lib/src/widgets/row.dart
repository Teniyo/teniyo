import 'package:teniyo/src/property/axis_alignment.dart';
import 'package:teniyo/src/lib/css.dart';
import 'package:teniyo/src/lib/html.dart';
import 'package:teniyo/src/property/main_axis_size.dart';
import 'package:teniyo/src/property/widget.dart';

class Row extends Widget{
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;

  Row({
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max
  });

  @override
  build(){
    return Html(
      tag: "div",
      style: Style({
        "display": "flex",
        "flex-direction": "row",
        "justify-content": mainAxisAlignment.value,
        "align-items": crossAxisAlignment.value,
        "width": mainAxisSize == MainAxisSize.max ? "100%" : "auto"
      }),
      children: children.map((e)=>e.build()).toList()
    );
  }
}