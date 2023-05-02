import 'package:teniyo/src/lib/teniyo.dart';
import 'assets_manager.dart';
import 'package:teniyo/src/lib/html.dart';
import 'widget.dart';
import 'package:teniyo/src/lib/not_web.dart' if (dart.library.html) 'package:teniyo/src/lib/is_web.dart';
import 'package:teniyo/src/lib/not_web.dart' if (dart.library.html) 'package:teniyo/src/lib/is_web.dart' as html;

class Window{
  double width, height;
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
    height = html.window.innerHeight?.toDouble() ?? 0;
    width = html.window.innerWidth?.toDouble() ?? 0;
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
  String? key;

  Page? parent;
  Widget Function() childBuilder;
  List<Widget Function()> childBuilderHistory = [];
  Function? disposeWidget;

  html.Element teniyoTag = html.querySelector('teniyo')!;
  late JsObject reactRoot;
  JsObject react = context['React'];
  JsObject reactDom = context['ReactDOM'];
  
  Page({required this.window, required this.pageElement, required this.teniyoAssets, required this.childBuilder}){
    childBuilderHistory.add(childBuilder);
    reactRoot = reactDom.callMethod('createRoot', [teniyoTag]);
  }

  void update(){
    disposeWidget?.call();

    teniyoAssets.update();
    Widget child = childBuilder();
    Html childRendered = child.build();
    disposeWidget = child.dispose = childRendered.dispose;

    JsObject pageResponse = childRendered.elementToReact();

    if (parent != null && key != null){
      reactRoot = reactDom.callMethod('createRoot', [html.querySelector("#$key")]);
    }

    reactRoot.callMethod('render', [pageResponse]);
  }

  void go(Teniyo page){
    childBuilder = () => page.build(this);
    childBuilderHistory.add(childBuilder);
    update();
  }

  void back(){
    if (childBuilderHistory.length == 1) return;

    childBuilderHistory.removeLast();
    childBuilder = childBuilderHistory.last;
    update();
  }
  
  Widget view(Teniyo app){
    Page page = Page(
      window: window,
      pageElement: pageElement,
      teniyoAssets: teniyoAssets,
      childBuilder: ()=>app.build(this),
    );
    page.parent = this;
    app.page = page;

    var res = app.build(page);
    page.key = res.key;

    return res;
  }
}