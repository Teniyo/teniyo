import 'dart:async';
import 'package:teniyo/src/lib/not_web.dart' if (dart.library.html) 'dart:js';

import 'package:teniyo/src/lib/css.dart';
import 'package:teniyo/src/lib/html.dart';
import 'package:teniyo/src/property/scroll_axis.dart';
import 'package:teniyo/src/property/widget.dart';

class ScrollView extends Widget{
  final Widget child;
  final ScrollAxis direction;

  ScrollView({
    required this.child,
    this.direction = ScrollAxis.both
  });

  @override
  Html build(){
    Html? h;
    return h=Html(
      tag: "div",
      attributes: {
        "onScroll": JsFunction.withThis((self,JsObject arg){
          h!.element!.classes.add("teniyo-scroll");
          if (h.data.containsKey('scrollAutoHidden')) h.data['scrollAutoHidden']!.cancel();
          h.data['scrollAutoHidden'] = Timer(const Duration(seconds: 1), () {
            h!.element?.classes.remove("teniyo-scroll");
            
          });
        })
      },
      style: Style({
        "overflow-y": [ScrollAxis.vertical,ScrollAxis.both].contains(direction) ? "overlay" : "hidden",
        "overflow-x": [ScrollAxis.horizontal,ScrollAxis.both].contains(direction) ? "overlay" : "hidden",
        "width": "100%",
        "height": "100%"
      }),
      children: child.build()
    );
  }
}