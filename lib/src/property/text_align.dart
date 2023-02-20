class TextAlign{
  const TextAlign._(this.index);
  final int index;
  static const left = TextAlign._(0);
  static const right = TextAlign._(1);
  static const center = TextAlign._(2);
  static const justify = TextAlign._(3);
}