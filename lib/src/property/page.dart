
import 'assets_manager.dart';
import 'package:teniyo/src/lib/html.dart';
import 'widget.dart';
import 'package:teniyo/src/lib/not_web.dart' if (dart.library.html) 'dart:html' as html;
import 'package:teniyo/src/lib/not_web.dart' if (dart.library.html) 'dart:js';
import 'package:teniyo/src/lib/not_web.dart' if (dart.library.html) 'package:teniyo/src/lib/is_web.dart';

class Window{
  int width;
  int height;
  final String title;
  final String? icon;

  Window({
    this.width = 0,
    this.height = 0,
    required this.title,
    this.icon,
  }){
    setTitle(title);
    setIcon("teniyo_assets/icons/teniyo.svg");
  }

  void setTitle(String title){
    html.document.title = title;
  }

  void setIcon(String icon){
    var element = html.document.querySelector('link[rel="icon"]');
    if (element==null){
      element = html.document.createElement('link');
      element.setAttribute('rel', 'icon');
      html.document.head!.append(element);
    }
    element.setAttribute('href', icon);
  }

}

class Page{
  final Window window;
  final html.Element pageElement;
  final AssetsManager teniyoAssets;
  late Widget Function() childBuilder;
  Function? disposeWidget;

  html.Element teniyoTag = html.querySelector('teniyo')!;
  late JsObject reactRoot;
  JsObject react = context['React'];
  JsObject reactDom = context['ReactDOM'];
  

  Page({required this.window, required this.pageElement, required this.teniyoAssets}){
    reactRoot = reactDom.callMethod('createRoot', [teniyoTag]);
  }

  void update(){
    disposeWidget?.call();

    teniyoAssets.update();
    Widget child = childBuilder();
    Html childRendered = child.build();
    disposeWidget = child.dispose = childRendered.dispose;

    JsObject pageResponse = child.build().elementToReact();
    reactRoot.callMethod('render', [pageResponse]);
  }
}