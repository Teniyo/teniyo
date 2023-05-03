import 'package:teniyo/src/property/attribute.dart';
import 'package:teniyo/src/lib/not_web.dart' if (dart.library.html) 'package:teniyo/src/lib/is_web.dart';
import 'package:teniyo/src/lib/css.dart';
import 'package:teniyo/src/lib/html.dart';
import 'package:teniyo/src/property/text_align.dart';
import 'package:teniyo/src/property/text_field_variant.dart';
import 'package:teniyo/src/property/widget.dart';

class TextEditingController{
  
}

class TextField extends Widget{
  String? label, palceholder, helperText, errorText;
  bool obscureText = false;
  bool disabled;
  TextEditingController? controller;
  int? maxLines, minLines;
  bool readOnly;
  bool multiline;
  TextAlign textAlign = TextAlign.justify;
  Function(String)?onChanged;
  TextFieldVariant variant;

  TextField({
    this.label,
    this.palceholder,
    this.obscureText = false,
    this.disabled = false,
    this.controller,
    this.maxLines,
    this.minLines,
    this.readOnly = false,
    this.textAlign = TextAlign.justify,
    this.onChanged,
    this.multiline = false,
    this.variant = TextFieldVariant.filled,
    this.helperText,
    this.errorText,
  });

  @override
  Html build(){
    Html? h;

    JsFunction onChanged = JsFunction.withThis((self, args){
      dynamic element;
      if (multiline) element = h!.element as TextAreaElement;
      else element = h!.element as InputElement;
      this.onChanged?.call(element.value!);
    });

    return h=Html(
      tag: "TextField",
      key: key,
      attributes: {
        "onChange": onChanged,
        "disabled": Attribute.setKey(disabled),
        "multiline": Attribute.setKey(multiline),
        "error": Attribute.setKey(errorText!=null),
        "maxRows": maxLines,
        "minRows": minLines,
        "variant": variant==TextFieldVariant.filled?"filled":
          variant==TextFieldVariant.outlined?"outlined":"standard",
        "label": label,
        "placeholder": palceholder,
        "helperText": errorText??helperText,
        "type": obscureText?"password":"text",
        "size": "small",
        "margin": "dense",
      },
      style: Style({
        "text-align": textAlign==TextAlign.justify?"justify":
          textAlign==TextAlign.center?"center":
          textAlign==TextAlign.left?"left":"right"
      }),
    );
  }
}