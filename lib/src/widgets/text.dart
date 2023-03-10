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
      style: Style({
        "color": color?.toHex() ?? const Color(0xFF000000).toHex(),
        "font-family": fontFamily,
        "font-size": fontSize!=null?"${fontSize}px":"16px", 
        "user-select": selectable==false?"none":"auto",
      }),
      children: text,
    );
  }
}