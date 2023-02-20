import 'dart:io';
import 'dart:isolate';

Future<void> putAssets(String buildPath) async {
  var packageUri = Uri.parse("package:teniyo/");
  var libPath = File.fromUri((await Isolate.resolvePackageUri(packageUri))!).path;
  var mainFolder = "${libPath}assets\\main";
  var teniyoAssets = "${libPath}assets\\teniyo_assets";
  
  Directory(buildPath).createSync();
  Directory("$buildPath\\teniyo_assets").createSync();

  copyFolder(teniyoAssets, "$buildPath\\teniyo_assets\\");
  copyFolder(mainFolder, buildPath);
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
