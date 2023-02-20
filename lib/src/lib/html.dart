import 'css.dart';
import 'extension.dart';
import 'tools.dart';
import 'package:teniyo/src/lib/not_web.dart' if (dart.library.html) 'dart:html' as html;
import 'package:teniyo/src/lib/not_web.dart' if (dart.library.html) 'dart:js';

class Html{
  final String tag;
  Map<String, dynamic> attributes = {};
  final dynamic children; // Html | List<Html> | String
  Style style = Style({});
  late String id;
  Map<String,dynamic> data = {};
  List<Function> disposes = [];

  Html({required this.tag, Map<String,dynamic>? attributes, this.children, Style? style}){
    if(style != null){
      this.style = style;
    }

    if (attributes!=null) this.attributes = attributes;
    else attributes = {};

    if (attributes.containsKey("id")) id = attributes["id"];
    else this.attributes["id"] = id = cuuid();
  }

  html.Element? get element => html.document.getElementById(id);

  html.Element render(){
    html.Element element = html.Element.tag(tag);
    element.style.cssText = style.render();

    attributes.forEach((key, value) {
      if (value is Function() && key == "onclick") {
        element.onClick.listen((event) {
          value();
        });
      }
      else{
        element.setAttribute(key, value);
      }
    });

    if(children is List<Html>){
      children.forEach((child) {
        element.append(child.render());
      });
    }
    else if(children is Html){
      element.append(children.render());
    }
    else if(children is String){
      element.appendText(children);
    }
    else if (children == null) {
      // do nothing
    }
    else{
      throw Exception("Invalid children type : $children / ${children.runtimeType}");
    }

    return element;
  }

  void dispose(){
    for (var disFunction in disposes) disFunction();
    
    if (children is List<Html>)
      for (Html child in children) child.dispose();

    else if (children is Html)
      children.dispose();
  }

  void addDispose(Function dispose){
    disposes.add(dispose);
  }

  JsObject elementToReact(){
    var react = context['React'];
    var mui = context['MaterialUI'];

    var children = [];
    if(this.children is List<Html>){
      this.children.forEach((Html child) {
        children.add(child.elementToReact());
      });
    }
    else if(this.children is Html){
      children.add(this.children.elementToReact());
    }
    else if(this.children is String){
      children.add(this.children);
    }
    else if (this.children == null) {
      // do nothing
    }
    else{
      throw Exception("Invalid children type : $children / ${children.runtimeType}");
    }
    
    // convert class in attributes to className
    Map attributes = Map.from(this.attributes);
    attributes.changeKey("class", "className");
    attributes.changeKey("onclick", "onClick");
    attributes["style"] = style.renderForReact();
    
    Map.from(attributes).forEach((key, value) {
      if (key[0]=='@'){
        if (value) attributes[key.substring(1)] = '-';
        attributes.remove(key);
      }
    });
    JsObject attrArray = JsObject.jsify(attributes);

    dynamic tagForRender;
    if (tag[0] == tag[0].toUpperCase()) tagForRender = mui[tag];
    else tagForRender = tag;

    return react.callMethod('createElement', [tagForRender, attrArray, ...children]);
  }
}
