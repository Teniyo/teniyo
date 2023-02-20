class Color {
  final int value;
  final int alpha;
  final int red;
  final int green;
  final int blue;
  final double opacity;

  const Color(this.value)
      : alpha = (value >> 24) & 0xFF,
        red = (value >> 16) & 0xFF,
        green = (value >> 8) & 0xFF,
        blue = value & 0xFF,
        opacity = (value >> 24) / 0xFF;

  Color.fromARGB(int a, int r, int g, int b)
      : value = (a << 24) | (r << 16) | (g << 8) | b,
        alpha = a,
        red = r,
        green = g,
        blue = b,
        opacity = a / 0xFF;

  Color.fromRGBO(int r, int g, int b, double o)
      : value = ((o * 0xFF).round() << 24) | (r << 16) | (g << 8) | b,
        alpha = (o * 0xFF).round(),
        red = r,
        green = g,
        blue = b,
        opacity = o;

  Color withAlpha(int a) {
    return Color.fromARGB(a, red, green, blue);
  }

  Color withRed(int r) {
    return Color.fromARGB(alpha, r, green, blue);
  }

  Color withGreen(int g) {
    return Color.fromARGB(alpha, red, g, blue);
  }

  Color withBlue(int b) {
    return Color.fromARGB(alpha, red, green, b);
  }

  Color withOpacity(double o) {
    return Color.fromRGBO(red, green, blue, o);
  }

  static Color alphaBlend(Color foreground, Color background) {
    final alpha = foreground.alpha + background.alpha * (0xFF - foreground.alpha) / 0xFF;
    final red = (foreground.red * foreground.alpha + background.red * background.alpha * (0xFF - foreground.alpha) / 0xFF) ~/ alpha;
    final green = (foreground.green * foreground.alpha + background.green * background.alpha * (0xFF - foreground.alpha) / 0xFF) ~/ alpha;
    final blue = (foreground.blue * foreground.alpha + background.blue * background.alpha * (0xFF - foreground.alpha) / 0xFF) ~/ alpha;
    return Color.fromARGB(alpha.round(), red, green, blue);
  }

  static int getAlphaFromOpacity(double opacity) {
    return (opacity * 0xFF).round();
  }

  static Color lerp(Color a, Color b, double t) {
    final alpha = (a.alpha + (b.alpha - a.alpha) * t).round();
    final red = (a.red + (b.red - a.red) * t).round();
    final green = (a.green + (b.green - a.green) * t).round();
    final blue = (a.blue + (b.blue - a.blue) * t).round();
    return Color.fromARGB(alpha, red, green, blue);
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Color) {
      return false;
    }
    final Color typedOther = other;
    return value == typedOther.value;
  }

  @override
  int get hashCode => value.hashCode;

  String toHex() {
    String red = this.red.toRadixString(16);
    String green = this.green.toRadixString(16);
    String blue = this.blue.toRadixString(16);
    String alpha = this.alpha.toRadixString(16);
    
    if(red.length == 1) red = "0$red";
    if(green.length == 1) green = "0$green";
    if(blue.length == 1) blue = "0$blue";
    if(alpha.length == 1) alpha = "0$alpha";

    return "#$red$green$blue$alpha";
  }
}


class Colors{
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color black = Color(0xFF000000);
  static const Color red = Color(0xFFF44336);
  static const Color pink = Color(0xFFE91E63);
  static const Color purple = Color(0xFF9C27B0);
  static const Color deepPurple = Color(0xFF673AB7);
  static const Color indigo = Color(0xFF3F51B5);
  static const Color blue = Color(0xFF2196F3);
  static const Color lightBlue = Color(0xFF03A9F4);
  static const Color cyan = Color(0xFF00BCD4);
  static const Color teal = Color(0xFF009688);
  static const Color green = Color(0xFF4CAF50);
  static const Color lightGreen = Color(0xFF8BC34A);
  static const Color lime = Color(0xFFCDDC39);
  static const Color yellow = Color(0xFFFFEB3B);
  static const Color amber = Color(0xFFFFC107);
  static const Color orange = Color(0xFFFF9800);
  static const Color deepOrange = Color(0xFFFF5722);
  static const Color brown = Color(0xFF795548);
  static const Color blueGrey = Color(0xFF607D8B);
  static const Color transparent = Color(0x00000000);
}