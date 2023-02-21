class Style{
  final Map<String,dynamic> styles;

  Style(this.styles);

  void set(String key, dynamic value){
    styles[key] = value;
  }

  void addStyle(Style style){
    styles.addAll(style.styles);
  }

  bool exist(String key){
    return styles.containsKey(key);
  }

  String render(){
    final buffer = StringBuffer();
    for (final key in styles.keys) {
      buffer.write('$key:${styles[key]};');
    }
    return buffer.toString();
  }

  Map renderForReact(){
    var styles = {};
    this.styles.forEach((key, value) {
      // convert name-name to nameName
      var newKey = key.split("-").map((e) => e[0].toUpperCase() + e.substring(1)).join();
      newKey = newKey[0].toLowerCase() + newKey.substring(1);
      styles[newKey] = value;
    });
    return styles;
  }
}