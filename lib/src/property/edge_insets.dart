class EdgeInsets {
  final double left;
  final double top;
  final double right;
  final double bottom;

  EdgeInsets.fromLTRB(
    this.left,
    this.top,
    this.right,
    this.bottom,
  );

  EdgeInsets.all(double value)
      : left = value,
        top = value,
        right = value,
        bottom = value;
  
  EdgeInsets.only({
    this.left = 0.0,
    this.top = 0.0,
    this.right = 0.0,
    this.bottom = 0.0
  });

  EdgeInsets.symmetric({
    double vertical = 0.0,
    double horizontal = 0.0,
  })  : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;

  String render() {
    return "${top}px ${right}px ${bottom}px ${left}px";
  }

}