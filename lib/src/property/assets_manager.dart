import 'package:teniyo/src/lib/not_web.dart' if (dart.library.html) 'dart:html' as html;
import 'package:teniyo/src/lib/not_web.dart' if (dart.library.html) 'dart:js';

class AssetsManager{
  Map<String,String> fonts = {};
  List<String> importedFonts = [];

  final JsObject teniyoAssetsRoot;

  AssetsManager(this.teniyoAssetsRoot);

  void addFontFromUrl(String name, String url){
    fonts[name] = url;
  }

  void addFontFromAsset(String name, String asset){
    fonts[name] = asset;
  }

  void importFont(String url){
    if (importedFonts.contains(url)) return;

    html.Element font = html.document.createElement('link')
    ..setAttribute('rel', 'stylesheet')
    ..setAttribute('href', url)
    ..setAttribute('type', 'text/css');

    html.document.querySelector('teniyo-assets')!.append(font);
    importedFonts.add(url);
  }

  void update(){
    for (var font in fonts.entries) {
      var f = html.FontFace(font.key, "url(${font.value})");
      f.load().then((value)=>html.document.fonts?.add(f));
    }
  }
}