import 'package:teniyo/src/lib/html.dart';
import 'package:teniyo/src/property/widget.dart';
import 'package:teniyo/src/widgets/drop_down_menu_item.dart';
import 'package:teniyo/src/lib/not_web.dart' if (dart.library.html) 'package:teniyo/src/lib/is_web.dart';

class DropDownButton<T> extends Widget{
  final T value;
  final List<DropDownMenuItem<T>> items;
  final Function(T value)? onChanged;
  final String? label;
  final bool fullWidth;

  DropDownButton({
    required this.value,
    required this.items,
    this.onChanged,
    this.label,
    this.fullWidth=false
  });

  @override
  Html build(){
    JsFunction onChanged = JsFunction.withThis((self,T value){
      this.onChanged?.call(value);
    });

    return Html(
      tag: "Teniyo.DropDownButtons",
      attributes: {
        "value": value,
        "label": label,
        "onChanged": onChanged,
        "fullWidth": fullWidth,
      },
      children: items.map((item)=>item.build()).toList(),
    );
  }
}