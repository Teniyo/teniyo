import 'package:teniyo/src/lib/html.dart';
import 'package:teniyo/src/property/widget.dart';
import 'package:teniyo/src/lib/not_web.dart' if (dart.library.html) 'package:teniyo/src/lib/is_web.dart';

class Switch extends Widget{
  final bool value, disabled;
  final Function(bool newValue)? onChanged;

  Switch({
    required this.value,
    this.onChanged,
    this.disabled = false,
  });

  @override
  Html build(){
    JsFunction onChanged = JsFunction.withThis((self,bool value){
      this.onChanged?.call(value);
    });

    return Html(
      tag: "Teniyo.Switch",
      key: key,
      attributes: {
        "value": value,
        "onChanged": onChanged,
        "disabled": disabled,
      },
    );
  }
}