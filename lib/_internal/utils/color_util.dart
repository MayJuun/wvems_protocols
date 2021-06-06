import 'package:flutter/material.dart';

// spec: https://stackoverflow.com/questions/58360989/programmatically-lighten-or-darken-a-hex-color-in-dart

class ColorUtil {
  // amount range from 0.0 to 1.0

  Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  Color lightenOrDarken(Color color, Brightness brightness,
      [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    // when in light mode, things get darker
    // reverse happens if dark mode
    return brightness == Brightness.light
        ? darken(color, amount)
        : lighten(color, amount);
  }

  // the primary color scheme is always designed with a lighter color
  // this utility class will modify this separately based on current brightness
  Color darkenedPrimaryText(Color color, Brightness brightness) {
    return (brightness == Brightness.dark)
        ? darken(color, 0.1)
        : darken(color, 0.4);
  }
}
