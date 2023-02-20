class BorderRadius{
  final double? topLeft, topRight, bottomLeft, bottomRight;

  BorderRadius({
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
  });

  BorderRadius.all(double value)
    : topLeft = value,
      topRight = value,
      bottomLeft = value,
      bottomRight = value;

  BorderRadius.only({
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
  });

  BorderRadius.circular(double value)
    : topLeft = value,
      topRight = value,
      bottomLeft = value,
      bottomRight = value;

  String render(){
    return "${topLeft}px ${topRight}px ${bottomLeft}px ${bottomRight}px";
  }
}