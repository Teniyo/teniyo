import 'package:teniyo/src/lib/css.dart';
import 'package:teniyo/src/lib/html.dart';
import 'package:teniyo/src/property/widget.dart';

class Spacer extends Widget{
  final bool horizontal;
  final bool vertical;

  Spacer({this.horizontal = true, this.vertical = true});

  @override
  build() {
    if (horizontal) {
      return Html(
        tag: 'div',
        key: key,
        style: Style({
          'flex': '1 0 0'
        }),
      );
    }
    else if (vertical) {
      return Html(
        tag: 'div',
        key: key,
        style: Style({
          'flex': '0 1 0'
        }),
      );
    }
    else if (horizontal && vertical){
      return Html(
        tag: 'div',
        key: key,
        style: Style({
          'flex': '1'
        }),
      );
    }
    else {
      return Html(
        tag: 'div',
        key: key,
        style: Style({
          'flex': '0'
        }),
      );
    }
  }
}