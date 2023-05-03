import 'package:teniyo/src/lib/html.dart';
import 'package:teniyo/src/property/color.dart';
import 'package:teniyo/src/property/widget.dart';

class Checkbox extends Widget{
  final bool value;
  final Function(bool)? onChanged;
  final Color? color, borderColor;

  Checkbox({required this.value, this.onChanged, this.color, this.borderColor});

  @override
  Html build(){
    return Html(
      tag: "Teniyo.Checkbox",
      key: key,
      attributes: {
        "value": value,
        "onChanged": onChanged,
        "sx": {
          "color" : borderColor?.toRgba(),
          "&.Mui-checked": {
            "color": color?.toRgba(),
          },
        }
      }
    );
  }
}