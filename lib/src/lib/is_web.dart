export 'dart:js';
export 'dart:html';

const bool isWeb = true;

class Directory{
  String path;
  Directory(this.path);
  existsSync(){}
  deleteSync({recursive}){}
  createSync({recursive}){}
  listSync({recursive, followLinks}){}
  static dynamic current;
}
class Platform{
  static dynamic script;
}
class ProcessResult{
  int exitCode = 0;
}
class Process{
  static runSync(String cmd, List args, {runInShell}){}
}

Future<void> putAssets(String buildPath) async {}