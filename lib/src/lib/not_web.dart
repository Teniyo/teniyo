// ignore_for_file: camel_case_types

export 'dart:io';
export 'package:teniyo/assets/main.dart';
export 'dart:isolate';

const bool isWeb = false;

class Element{
  append(Element e){}
  appendText(String s){}
  dynamic style, onClick, classes, onChange;
  static tag(String s){}
  setAttribute(String key, dynamic value){}
  querySelector(String s){return Element();}
  dynamic onContextMenu = WindowOnResize();
  createElement(String s){return Element();}
  dynamic fonts;
  set title(String s){}
  dynamic head;
  getElementById(String s){}
}
Element document = Element();
class FontFace{
  FontFace(String name, String url);
  load(){}
}
class JsObject{
  callMethod(String name, List args){return this;}
  static jsify(Map m){return JsObject();}
  operator [](String name){}
}
class JsFunction{
  static withThis(Function f){return JsFunction();}
}

class _context{
  JsObject operator [](String name){
    return JsObject();
  }
}

dynamic context = _context();

querySelector(String name){return Element();}
class WindowOnResize{
  listen(Function f){}
}
class window{
  static WindowOnResize onResize = WindowOnResize();
  static dynamic innerWidth, innerHeight;
}
class TextAreaElement{}
class InputElement{
  bool checked = false;
}
