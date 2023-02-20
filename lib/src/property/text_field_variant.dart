class TextFieldVariant{
  const TextFieldVariant._(this.index);
  final int index;
  static const outlined = TextFieldVariant._(0);
  static const filled = TextFieldVariant._(1);
  static const standard = TextFieldVariant._(2);
}