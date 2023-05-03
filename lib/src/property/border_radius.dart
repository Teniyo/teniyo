class BorderRadius{
  final double topLeft, topRight, bottomLeft, bottomRight;

  BorderRadius({
    this.topLeft=0,
    this.topRight=0,
    this.bottomLeft=0,
    this.bottomRight=0,
  });

  BorderRadius.all(double value)
    : topLeft = value,
      topRight = value,
      bottomLeft = value,
      bottomRight = value;

  BorderRadius.only({
    this.topLeft=0,
    this.topRight=0,
    this.bottomLeft=0,
    this.bottomRight=0,
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