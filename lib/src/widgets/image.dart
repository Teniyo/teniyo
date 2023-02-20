import 'package:teniyo/src/property/border_radius.dart';
import 'package:teniyo/src/property/box_fit.dart';
import 'package:teniyo/src/lib/css.dart';
import 'package:teniyo/src/lib/html.dart';
import 'package:teniyo/src/property/widget.dart';

enum _ImageType { asset, network }
class Image extends Widget{
  final String path;
  double? width, height;
  BoxFit? fit = BoxFit.fill;
  BorderRadius? borderRadius;
  late _ImageType type;
  
  Image.asset(this.path, {this.width, this.height, this.fit, this.borderRadius}) {
    type = _ImageType.asset;
  }

  Image.network(this.path, {this.width, this.height, this.fit, this.borderRadius}) {
    type = _ImageType.network;
  }

  // Image.file(this.path, {this.width, this.height, this.fit, this.borderRadius}) {
  //   type = _ImageType.file;
  // }

  @override
  Html build(){
    return Html(
      tag: 'img',
      attributes: {
        'src': path,
        'draggable': 'false',
      },
      style: Style({
        'width': width!=null?"${width}px":null,
        'height': height!=null?"${height}px":null,
        'border-radius': borderRadius?.render(),
        'object-fit': fit?.toString() ?? BoxFit.fill.toString(),
      })
    );
  }
}