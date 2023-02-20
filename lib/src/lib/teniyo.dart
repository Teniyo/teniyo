// ignore_for_file: duplicate_import

import 'dart:io';
import '../property/assets_manager.dart';
import '../property/color.dart';
import '../property/page.dart';
import '../property/widget.dart';
import 'package:teniyo/src/widgets/container.dart';
import 'package:teniyo/src/lib/not_web.dart' if (dart.library.html) 'dart:html' as html;
import 'package:teniyo/src/lib/not_web.dart' if (dart.library.html) 'dart:js';
import 'package:teniyo/src/lib/not_web.dart' if (dart.library.html) 'package:teniyo/src/lib/is_web.dart';
import 'package:teniyo/assets/main.dart' if (dart.library.html) 'package:teniyo/src/lib/is_web.dart' as build_assets;

class Teniyo{
  Window window = Window(title: 'Teniyo');
  late Page page;
  JsObject react = context['React'];
  JsObject reactDom = context['ReactDOM'];
  late JsObject teniyoAssetsRoot;
  late AssetsManager assetsManager;

  Teniyo(){
    initApp();
    initState(page);
  }

  void initApp(){
    teniyoAssetsRoot = reactDom.callMethod('createRoot', [html.querySelector('teniyo-assets')!]);
    assetsManager = AssetsManager(teniyoAssetsRoot);

    html.window.onResize.listen((event) {
      window.height = html.window.innerHeight ?? 0;
      window.width = html.window.innerWidth ?? 0;
    });

    page = Page(
      window: window,
      pageElement: html.document.querySelector('teniyo')!,
      teniyoAssets: assetsManager
    );

    html.document.onContextMenu.listen((event) {
      event.preventDefault();
    });
  }
  void initState(Page page){}
  void setState([void Function()? function]){
    if (function!=null) function();
    page.update();
  }

  Widget build(Page page) => Container(color: Color(0xffff0000));

  Future<void> run() async {
    if (!isWeb) {
      String
        pwd = Directory.current.path,
        buildPath = '$pwd\\build',
        mainFile = Platform.script.toFilePath(),
        mainFileJs = "main.js";

      if (Directory(buildPath).existsSync())
        Directory(buildPath).deleteSync(recursive: true);

      await build_assets.putAssets(buildPath);
      print('Assets copied to $buildPath');
      
      ProcessResult process = Process.runSync('dart', ["compile", "js", mainFile, "-o", 'build\\$mainFileJs'], runInShell: true);
      if (process.exitCode != 0)
        throw TeniyoError(from: 'Teniyo.run()', message: 'Failed to compile dart to js');
      
      print('Compiled to js');
      print("Build successfull, open $buildPath\\index.html");

    }
    page.childBuilder = ()=>build(page);
    page.update();
  }
}

class TeniyoError{
  final String from;
  final String message;

  TeniyoError({required this.from, required this.message}){
    print("Teniyo Error: ($from)\n$message");
  }
}