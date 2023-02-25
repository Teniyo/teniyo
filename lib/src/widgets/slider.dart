import 'package:teniyo/src/lib/html.dart';
import 'package:teniyo/src/property/widget.dart';
import 'package:teniyo/src/lib/not_web.dart' if (dart.library.html) 'package:teniyo/src/lib/is_web.dart';

class Slider extends Widget{
  final double value, min, max;
  final int? step;
  final Function(double value)? onChanged;
  final bool disabled, showLabel, markStep;
  final String? label;


  Slider({
    required this.value,
    this.min = 0,
    required this.max,
    this.step,
    this.onChanged,
    this.disabled = false,
    this.label,
    this.showLabel = true,
    this.markStep = false,
  });

  @override
  Html build(){
    JsFunction onChanged = JsFunction.withThis((self,double value){
      this.onChanged?.call(value);
    });

    return Html(
      tag: "Teniyo.Slider",
      attributes: {
        "value": value,
        "min": min,
        "max": max,
        "step": step??(max-min)/100,
        "onChanged": onChanged,
        "disabled": disabled,
        "label": label,
        "showLabel": showLabel,
        "markStep": markStep,
      },
    );
  }
}