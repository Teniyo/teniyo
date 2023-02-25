import 'package:teniyo/src/lib/not_web.dart' if (dart.library.html) 'package:teniyo/src/lib/is_web.dart';

Future<void> putAssets(String buildPath) async {
  var packageUri = Uri.parse("package:teniyo/");
  var libPath = File.fromUri((await Isolate.resolvePackageUri(packageUri))!).path;
  var mainFolder = "${libPath}assets\\main";
  var teniyoAssets = "${libPath}assets\\teniyo_assets";
  var assets = "${Directory.current.path}\\assets";
  
  Directory(buildPath).createSync();
  Directory("$buildPath\\teniyo_assets").createSync();

  copyFolder(teniyoAssets, "$buildPath\\teniyo_assets\\");
  copyFolder(mainFolder, buildPath);

  if (Directory(assets).existsSync())
    copyFolder(assets, "$buildPath\\assets");
}

void copyFolder(String path, String pastePath){
  Directory(path).listSync().forEach((element) {
    if (element is File){
      File file = File('$pastePath\\${element.path.split("\\").last}');
      file.createSync();
      file.writeAsBytesSync(element.readAsBytesSync());
    } else if (element is Directory){
      Directory dir = Directory('$pastePath\\${element.path.split("\\").last}');
      dir.createSync();
      copyFolder(element.path, dir.path);
    }
  });
}
