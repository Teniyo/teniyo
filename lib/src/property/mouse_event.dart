import 'package:teniyo/src/lib/html.dart';
import 'package:teniyo/src/property/widget.dart';
import 'package:teniyo/src/lib/not_web.dart' if (dart.library.html) 'package:teniyo/src/lib/is_web.dart';

class MouseEvent extends Widget{
  final Function()? onEnter, onHover, onExit, onClick;
  final Widget child;

  MouseEvent({    
    this.onEnter,
    this.onHover,
    this.onExit,
    this.onClick,
    required this.child,
  });

  @override
  Html build(){
    JsFunction onEnter = JsFunction.withThis((self){
      this.onEnter?.call();
    });
    JsFunction onHover = JsFunction.withThis((self){
      this.onHover?.call();
    });
    JsFunction onExit = JsFunction.withThis((self){
      this.onExit?.call();
    });
    JsFunction onClick = JsFunction.withThis((self){
      this.onClick?.call();
    });

    return Html(
      tag: "Teniyo.MouseRegion",
      children: child.build(),
      attributes: {
        "onEnter": onEnter,
        "onHover": onHover,
        "onExit": onExit,
        "onClick": onClick,
      }
    );

  }
}