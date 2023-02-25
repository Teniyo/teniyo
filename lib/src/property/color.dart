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

class MaterialColor extends Color{
  final Map<int, Color> _swatch;
  MaterialColor(super.value, this._swatch);

  Color operator [](int index) => _swatch[index]!;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MaterialColor) {
      return false;
    }
    final MaterialColor typedOther = other;
    return value == typedOther.value && _swatch == typedOther._swatch;
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, _swatch);
}

class Colors{

  static final MaterialColor red = MaterialColor(
    0xFFF44336,
    {
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(0xFFF44336),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71C1C),
    }
  );

  static final MaterialColor pink = MaterialColor(
    0xFFE91E63,
    {
      50: Color(0xFFFCE4EC),
      100: Color(0xFFF8BBD0),
      200: Color(0xFFF48FB1),
      300: Color(0xFFF06292),
      400: Color(0xFFEC407A),
      500: Color(0xFFE91E63),
      600: Color(0xFFD81B60),
      700: Color(0xFFC2185B),
      800: Color(0xFFAD1457),
      900: Color(0xFF880E4F),
    }
  );

  static final MaterialColor purple = MaterialColor(
    0xFF9C27B0,
    {
      50: Color(0xFFF3E5F5),
      100: Color(0xFFE1BEE7),
      200: Color(0xFFCE93D8),
      300: Color(0xFFBA68C8),
      400: Color(0xFFAB47BC),
      500: Color(0xFF9C27B0),
      600: Color(0xFF8E24AA),
      700: Color(0xFF7B1FA2),
      800: Color(0xFF6A1B9A),
      900: Color(0xFF4A148C),
    }
  );

  static final MaterialColor deepPurple = MaterialColor(
    0xFF673AB7,
    {
      50: Color(0xFFEDE7F6),
      100: Color(0xFFD1C4E9),
      200: Color(0xFFB39DDB),
      300: Color(0xFF9575CD),
      400: Color(0xFF7E57C2),
      500: Color(0xFF673AB7),
      600: Color(0xFF5E35B1),
      700: Color(0xFF512DA8),
      800: Color(0xFF4527A0),
      900: Color(0xFF311B92),
    }
  );

  static final MaterialColor indigo = MaterialColor(
    0xFF3F51B5,
    {
      50: Color(0xFFE8EAF6),
      100: Color(0xFFC5CAE9),
      200: Color(0xFF9FA8DA),
      300: Color(0xFF7986CB),
      400: Color(0xFF5C6BC0),
      500: Color(0xFF3F51B5),
      600: Color(0xFF3949AB),
      700: Color(0xFF303F9F),
      800: Color(0xFF283593),
      900: Color(0xFF1A237E),
    }
  );

  static final MaterialColor blue = MaterialColor(
    0xFF2196F3,
    {
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(0xFF2196F3),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    }
  );

  static final MaterialColor lightBlue = MaterialColor(
    0xFF03A9F4,
    {
      50: Color(0xFFE1F5FE),
      100: Color(0xFFB3E5FC),
      200: Color(0xFF81D4FA),
      300: Color(0xFF4FC3F7),
      400: Color(0xFF29B6F6),
      500: Color(0xFF03A9F4),
      600: Color(0xFF039BE5),
      700: Color(0xFF0288D1),
      800: Color(0xFF0277BD),
      900: Color(0xFF01579B),
    }
  );

  static final MaterialColor cyan = MaterialColor(
    0xFF00BCD4,
    {
      50: Color(0xFFE0F7FA),
      100: Color(0xFFB2EBF2),
      200: Color(0xFF80DEEA),
      300: Color(0xFF4DD0E1),
      400: Color(0xFF26C6DA),
      500: Color(0xFF00BCD4),
      600: Color(0xFF00ACC1),
      700: Color(0xFF0097A7),
      800: Color(0xFF00838F),
      900: Color(0xFF006064),
    }
  );

  static final MaterialColor teal = MaterialColor(
    0xFF009688,
    {
      50: Color(0xFFE0F2F1),
      100: Color(0xFFB2DFDB),
      200: Color(0xFF80CBC4),
      300: Color(0xFF4DB6AC),
      400: Color(0xFF26A69A),
      500: Color(0xFF009688),
      600: Color(0xFF00897B),
      700: Color(0xFF00796B),
      800: Color(0xFF00695C),
      900: Color(0xFF004D40),
    }
  );

  static final MaterialColor green = MaterialColor(
    0xFF4CAF50,
    {
      50: Color(0xFFE8F5E9),
      100: Color(0xFFC8E6C9),
      200: Color(0xFFA5D6A7),
      300: Color(0xFF81C784),
      400: Color(0xFF66BB6A),
      500: Color(0xFF4CAF50),
      600: Color(0xFF43A047),
      700: Color(0xFF388E3C),
      800: Color(0xFF2E7D32),
      900: Color(0xFF1B5E20),
    }
  );

  static final MaterialColor lightGreen = MaterialColor(
    0xFF8BC34A,
    {
      50: Color(0xFFF1F8E9),
      100: Color(0xFFDCEDC8),
      200: Color(0xFFC5E1A5),
      300: Color(0xFFAED581),
      400: Color(0xFF9CCC65),
      500: Color(0xFF8BC34A),
      600: Color(0xFF7CB342),
      700: Color(0xFF689F38),
      800: Color(0xFF558B2F),
      900: Color(0xFF33691E),
    }
  );

  static final MaterialColor lime = MaterialColor(
    0xFFCDDC39,
    {
      50: Color(0xFFF9FBE7),
      100: Color(0xFFF0F4C3),
      200: Color(0xFFE6EE9C),
      300: Color(0xFFDCE775),
      400: Color(0xFFD4E157),
      500: Color(0xFFCDDC39),
      600: Color(0xFFC0CA33),
      700: Color(0xFFAFB42B),
      800: Color(0xFF9E9D24),
      900: Color(0xFF827717),
    }
  );

  static final MaterialColor yellow = MaterialColor(
    0xFFFFEB3B,
    {
      50: Color(0xFFFFFDE7),
      100: Color(0xFFFFF9C4),
      200: Color(0xFFFFF59D),
      300: Color(0xFFFFF176),
      400: Color(0xFFFFEE58),
      500: Color(0xFFFFEB3B),
      600: Color(0xFFFDD835),
      700: Color(0xFFFBC02D),
      800: Color(0xFFF9A825),
      900: Color(0xFFF57F17),
    }
  );

  static final MaterialColor amber = MaterialColor(
    0xFFFFC107,
    {
      50: Color(0xFFFFF8E1),
      100: Color(0xFFFFECB3),
      200: Color(0xFFFFE082),
      300: Color(0xFFFFD54F),
      400: Color(0xFFFFCA28),
      500: Color(0xFFFFC107),
      600: Color(0xFFFFB300),
      700: Color(0xFFFFA000),
      800: Color(0xFFFF8F00),
      900: Color(0xFFFF6F00),
    }
  );

  static final MaterialColor orange = MaterialColor(
    0xFFFF9800,
    {
      50: Color(0xFFFFF3E0),
      100: Color(0xFFFFE0B2),
      200: Color(0xFFFFCC80),
      300: Color(0xFFFFB74D),
      400: Color(0xFFFFA726),
      500: Color(0xFFFF9800),
      600: Color(0xFFFB8C00),
      700: Color(0xFFF57C00),
      800: Color(0xFFEF6C00),
      900: Color(0xFFE65100),
    }
  );

  static final MaterialColor deepOrange = MaterialColor(
    0xFFFF5722,
    {
      50: Color(0xFFFBE9E7),
      100: Color(0xFFFFCCBC),
      200: Color(0xFFFFAB91),
      300: Color(0xFFFF8A65),
      400: Color(0xFFFF7043),
      500: Color(0xFFFF5722),
      600: Color(0xFFF4511E),
      700: Color(0xFFE64A19),
      800: Color(0xFFD84315),
      900: Color(0xFFBF360C),
    }
  );

  static final MaterialColor brown = MaterialColor(
    0xFF795548,
    {
      50: Color(0xFFEFEBE9),
      100: Color(0xFFD7CCC8),
      200: Color(0xFFBCAAA4),
      300: Color(0xFFA1887F),
      400: Color(0xFF8D6E63),
      500: Color(0xFF795548),
      600: Color(0xFF6D4C41),
      700: Color(0xFF5D4037),
      800: Color(0xFF4E342E),
      900: Color(0xFF3E2723),
    }
  );

  static final MaterialColor grey = MaterialColor(
    0xFF9E9E9E,
    {
      50: Color(0xFFFAFAFA),
      100: Color(0xFFF5F5F5),
      200: Color(0xFFEEEEEE),
      300: Color(0xFFE0E0E0),
      400: Color(0xFFBDBDBD),
      500: Color(0xFF9E9E9E),
      600: Color(0xFF757575),
      700: Color(0xFF616161),
      800: Color(0xFF424242),
      900: Color(0xFF212121),
    }
  );

  static final MaterialColor blueGrey = MaterialColor(
    0xFF607D8B,
    {
      50: Color(0xFFECEFF1),
      100: Color(0xFFCFD8DC),
      200: Color(0xFFB0BEC5),
      300: Color(0xFF90A4AE),
      400: Color(0xFF78909C),
      500: Color(0xFF607D8B),
      600: Color(0xFF546E7A),
      700: Color(0xFF455A64),
      800: Color(0xFF37474F),
      900: Color(0xFF263238),
    }
  );

  static final Color transparent = Color(0x00000000);
  static final Color white = Color(0xFFFFFFFF);
  static final Color black = Color(0xFF000000);
}