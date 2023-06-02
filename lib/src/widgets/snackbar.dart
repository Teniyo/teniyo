import 'package:teniyo/src/lib/html.dart';
import 'package:teniyo/src/property/widget.dart';
import 'package:teniyo/src/lib/not_web.dart' if (dart.library.html) 'package:teniyo/src/lib/is_web.dart';

class Snackbar extends Widget{
  final String content;
  final Duration autoHideDuration;
  final Function()? onClick, onClose;

  Snackbar({    
    required this.content,
    this.autoHideDuration = const Duration(seconds: 3),
    this.onClick,
    this.onClose
  });

  @override
  Html build(){
    JsFunction onClick = JsFunction.withThis((self){
      this.onClick?.call();
    });

    JsFunction onClose = JsFunction.withThis((self){
      this.onClose?.call();
    });

    return Html(
      tag: "Teniyo.Snackbar",
      key: key,
      attributes: {
        "content": content,
        "duration": autoHideDuration.inMilliseconds,
        "onClick": onClick,
        "onClose": onClose
      }
    );
  }
}