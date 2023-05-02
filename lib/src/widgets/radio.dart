import 'package:teniyo/src/lib/html.dart';
import 'package:teniyo/src/property/widget.dart';
import 'package:teniyo/src/lib/not_web.dart' if (dart.library.html) 'package:teniyo/src/lib/is_web.dart';

class Radio extends Widget{
  final bool value;
  final Function(bool value)? onChanged;

  Radio({required this.value, this.onChanged});

  @override
  Html build(){
    JsFunction onChanged = JsFunction.withThis((self,bool value){
      this.onChanged?.call(value);
    });

    return Html(
      tag: "Teniyo.Radio",
      key: key,
      attributes: {
        "value": value,
        "onChanged": onChanged,
      },
    );
  }
}