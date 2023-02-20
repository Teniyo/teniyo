class MainAxisAlignment{
  final String value;
  const MainAxisAlignment._(this.value);
  static const start = MainAxisAlignment._("flex-start");
  static const center = MainAxisAlignment._("center");
  static const end = MainAxisAlignment._("flex-end");
  static const spaceBetween = MainAxisAlignment._("space-between");
  static const spaceAround = MainAxisAlignment._("space-around");
  static const spaceEvenly = MainAxisAlignment._("space-evenly");
}

class CrossAxisAlignment{
  final String value;
  const CrossAxisAlignment._(this.value);
  static const start = CrossAxisAlignment._("flex-start");
  static const center = CrossAxisAlignment._("center");
  static const end = CrossAxisAlignment._("flex-end");
}