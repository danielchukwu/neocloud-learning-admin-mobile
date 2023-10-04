import 'dart:ui';

Color getColorOpposite(Color color) {
  return Color.fromARGB(
      color.alpha,
      255 - color.red,
      255 - color.green,
      255 - color.blue,
    );
}