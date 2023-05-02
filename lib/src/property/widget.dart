import 'package:teniyo/src/lib/html.dart';
import 'package:teniyo/src/lib/tools.dart';

class Widget{
  String key = cuuid(pre:'key-');
  Function dispose = (){};
  Html build ()=> Html(tag: "teniyo", key: key);
}