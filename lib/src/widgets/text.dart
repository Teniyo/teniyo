import 'package:teniyo/src/property/color.dart';
import 'package:teniyo/src/lib/css.dart';
import 'package:teniyo/src/lib/html.dart';
import 'package:teniyo/src/property/widget.dart';

class Text extends Widget{
  final String text;
  Color? color;
  final String? fontFamily;
  final int? fontSize;
  bool? selectable;

  Text(
    this.text,
    {
      this.color,
      this.fontFamily,
      this.fontSize,
      this.selectable
    });

  @override
  Html build(){
    return Html(
      tag: "span",
      key: key,
      style: Style({
        "color": color?.toRgba() ?? const Color(0xFF000000).toRgba(),
        "font-family": fontFamily,
        "font-size": fontSize!=null?"${fontSize}px":"16px", 
        "user-select": selectable==false?"none":"auto",
      }),
      children: text,
    );
  }
}