class ScrollAxis{
  const ScrollAxis._(this.index);
  final int index;
  static const ScrollAxis horizontal = ScrollAxis._(0);
  static const ScrollAxis vertical = ScrollAxis._(1);
  static const ScrollAxis both = ScrollAxis._(2);
}