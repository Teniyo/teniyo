import 'package:teniyo/src/lib/html.dart';
import 'package:teniyo/src/lib/not_web.dart' if (dart.library.html) 'package:teniyo/src/lib/is_web.dart';
import 'package:teniyo/src/lib/not_web.dart' if (dart.library.html) 'package:teniyo/src/lib/is_web.dart' as html;
import 'package:teniyo/src/lib/tools.dart';

class Jsx {
  final String tag;
  final dynamic children;
  final Map<String, dynamic> attributes;
  final String key;

  Jsx({
    required this.tag,
    this.children,
    this.attributes = const {},
    String? key
  }):key = key ?? cuuid();

  Jsx.fromHtml(Html html):
    this(
      tag: html.tag,
      children: html.children,
      attributes: html.attributes..remove("id"),
      key: html.key
    );

  Html getHtml(){
    return Html(
      tag: tag,
      key: key,
      children: children,
      attributes: attributes,
    );
  }

  void render(String querySelector){
    var reactDom = context['ReactDOM'];
    var root = html.querySelector(querySelector);

    var reactRoot = reactDom.callMethod('createRoot', [root]);
    
    reactRoot.callMethod('render', [getHtml().elementToReact()]);
  }
}