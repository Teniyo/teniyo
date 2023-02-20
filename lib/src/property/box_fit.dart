class BoxFit{
  const BoxFit._(this.index);
  final String index;
  static const BoxFit fill = BoxFit._('fill');
  static const BoxFit contain = BoxFit._('contain');
  static const BoxFit cover = BoxFit._('cover');
  // static const BoxFit fitWidth = BoxFit._('fitWidth');
  // static const BoxFit fitHeight = BoxFit._('fitHeight');
  static const BoxFit none = BoxFit._('none');
  static const BoxFit scaleDown = BoxFit._('scale-down');

  @override
  String toString(){
    return index;
  }
}