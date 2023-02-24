import 'package:teniyo/src/lib/html.dart';
import 'package:teniyo/src/property/widget.dart';

class DropDownMenuItem<T> extends Widget{
  final T value;
  final Widget child;

  DropDownMenuItem({required this.value, required this.child});

  @override
  Html build(){
    return Html(
      tag: "MenuItem",
      attributes: {
        "value": value,
      },
      children: child.build(),
    );
  }
}