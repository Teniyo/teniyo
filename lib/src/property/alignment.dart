class Alignment{
  const Alignment(this.x, this.y);
  final double x;
  final double y;
  static const Alignment topLeft = Alignment(-1.0, -1.0);
  static const Alignment topCenter =  Alignment(0.0, -1.0);
  static const Alignment topRight =  Alignment(1.0, -1.0);
  static const Alignment centerLeft =  Alignment(-1.0, 0.0);
  static const Alignment center =  Alignment(0.0, 0.0);
  static const Alignment centerRight =  Alignment(1.0, 0.0);
  static const Alignment bottomLeft =  Alignment(-1.0, 1.0);
  static const Alignment bottomCenter =  Alignment(0.0, 1.0);
  static const Alignment bottomRight =  Alignment(1.0, 1.0);
}