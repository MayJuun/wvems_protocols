import 'package:flutter/material.dart';

class _AppColors {
  // Ekey 5/18 - first attempt at playing with the colors
  //the light mode colors
  static const Color lightBackground = Color(0xFFFFFFFF); //white background [aka: Theme.of(context).backgroundColor]
  static const Color lightSearchBackground = Color(0xFFFFFFFF); //white background
  static const Color lightOnBackground = Color(0xFF707070); //dark grey for text and icons (5:1 contrast with white background)
  static const Color lightBackgroundYear = Color(0xFFB2B2B2); //yearly background color (this is 2019 by default, will be updated dynamically when a pdf loads...)
  static const Color lightOnBackgroundYear = Color(0xFF0F0F0F); //near-black text for use on yearly background color (at least 7:1 contrast)
  static const Color lightAccentGrey = Color(0xFFEEEEEE); //very light grey accent for borders/dividers on a light background (only 1.2:1 contrast with white)

  //the dark mode colors
  static const Color darkBackground = Color(0xFF000000); //black background
  static const Color darkSearchBackground = Color(0xFF424242); //slightly less black background
  static const Color darkOnBackground = Color(0xFFBDBDBD); //light grey for text and icons (11.2:1 contrast with black background)
//  static const Color darkBackgroundYear = **not used right now
//  static const Color darkOnBackgroundYear = **not used right now...
  static const Color darkAccentGrey = Color(0xFF424242); //very dark grey accent for borders/dividers on a dark background (only 2.1:1 contrast with black)

  //WVEMS colors for minor accents
  static const Color darkBlueWVEMS = Color(0xFF2A2C7C); //dark WVEMS blue (12:1 with white background, but only 1.7:1 with black)
  static const Color lightBlueWVEMS = Color(0xFF20A4CE); //WVEMS light blue (11.2:1 contrast with black background, but only 2.9:1 contrast with white)
}

TextTheme _buildTextTheme() {
  return TextTheme(
    headline1: _style(96.0, FontWeight.normal),
    headline2: _style(60.0, FontWeight.bold),
    headline3: _style(48.0, FontWeight.normal),
    headline4: _style(36.0, FontWeight.bold),
    headline5: _style(22.0, FontWeight.w500),
    headline6: _style(18.0, FontWeight.w500),
    bodyText1: _style(18.0, FontWeight.normal),
    bodyText2: _style(16.0, FontWeight.normal),
    subtitle1: _style(16.0, FontWeight.normal),
    subtitle2: _style(14.0, FontWeight.normal),
    button: _style(18.0, FontWeight.normal),
    caption: _style(12.0, FontWeight.normal),
    overline: _style(16.0, FontWeight.normal),
    // );
  ).apply(fontFamily: 'Barlow'); //the protocols are written in Barlow
}

TextStyle _style(double s, FontWeight w) =>
    TextStyle(fontSize: s, fontWeight: w);

// AppTheme inspired by: https://github.com/gskinnerTeam/flokk
// The main exception is that we're using Get instead of Provider for AppTheme
// Thus, we use the ThemeController to directly call AppTheme
// and context.textTheme (instead of Get.textTheme) to ensure the theme is mutable
enum ThemeType { LightMode, DarkMode }

class AppTheme {
  AppTheme({this.lightModePrimaryColor, this.darkModePrimaryColor});

  /// fromType factory constructor
  factory AppTheme.fromType(
      {required ThemeType themeType,
      Color? lightModeColor,
      Color? darkModeColor}) {
    switch (themeType) {
      case ThemeType.LightMode: //this is the light mode color scheme (this is where you assign the static colors to the elements)
        return AppTheme(
            lightModePrimaryColor: lightModeColor,
            darkModePrimaryColor: darkModeColor)
          .._isDark = false
          .._background = _AppColors.lightBackground
          .._onBackground = _AppColors.lightOnBackground

          .._primary = lightModeColor ?? _AppColors.lightBackgroundYear // this could be from the ToC of a pdf
          .._primaryVariant  = _AppColors.lightBackgroundYear //ummmm unknown use so far....
          .._onPrimary = _AppColors.lightOnBackgroundYear

          .._secondary = _AppColors.darkBlueWVEMS
          .._secondaryVariant = _AppColors.lightBlueWVEMS
          .._onSecondary = _AppColors.darkAccentGrey

          .._surface = _AppColors.lightSearchBackground
          .._onSurface = _AppColors.lightOnBackground
          .._divider = _AppColors.lightAccentGrey;

      case ThemeType.DarkMode: //this is the dark mode color scheme (this is where you assign the static colors to the elements)
        return AppTheme(
            lightModePrimaryColor: lightModeColor,
            darkModePrimaryColor: darkModeColor)
          .._isDark = true
          .._background = _AppColors.darkBackground
          .._onBackground = _AppColors.darkOnBackground

          .._primary = lightModeColor ?? _AppColors.lightBackgroundYear // this could be from the ToC of a pdf (only light colors right now)
          .._primaryVariant  = _AppColors.lightBackgroundYear //ummmm unknown use so far....
          .._onPrimary = _AppColors.lightOnBackgroundYear

          .._secondary = _AppColors.lightBlueWVEMS
          .._secondaryVariant = _AppColors.darkBlueWVEMS
          .._onSecondary = _AppColors.lightAccentGrey

          .._surface = _AppColors.darkSearchBackground
          .._onSurface = _AppColors.darkOnBackground
          .._divider = _AppColors.darkAccentGrey;
    }
  }
  final Color? lightModePrimaryColor;
  final Color? darkModePrimaryColor;

  static ThemeType defaultTheme = ThemeType.LightMode;

  late bool  _isDark;
  late Color _background;
  late Color _onBackground;

  late Color _primary;
  late Color _primaryVariant;
  late Color _onPrimary;

  late Color _secondary;
  late Color _secondaryVariant;
  late Color _onSecondary;

  late Color _surface;
  late Color _onSurface;
  late Color _divider;

  ThemeData get themeData {  //this is just copying over the constructs above to the actual theme of the app
    final t = ThemeData.from(
      textTheme: _buildTextTheme(),
      colorScheme: ColorScheme(
        brightness: _isDark ? Brightness.dark : Brightness.light,
        background: _background,
        onBackground: _onBackground,

        primary: _primary, // the year color
        primaryVariant: _primaryVariant, //still unknown use....
        onPrimary: _onPrimary, // near-black for text on the year color

        secondary: _secondary, //WVEMS blue (high contrast on background)
        secondaryVariant: _secondaryVariant, //WVEMS blue (low contrast on background)
        onSecondary: _onSecondary, //grey

        surface: _surface,
        onSurface: _onSurface,

        onError: const Color(0xFF39FF14), //neon error text
        error: const Color(0xFFFF007F), //hot pink error
      ),
    );
    return t.copyWith(
      canvasColor: _background,
        scaffoldBackgroundColor: _background,
        typography: Typography.material2018(),
        accentTextTheme: _buildTextTheme().apply(bodyColor: _onBackground),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: _secondary,
          selectionColor: _secondaryVariant,
          selectionHandleColor: Colors.transparent,
        ),
        dividerColor: _divider,
        buttonColor: _secondary,
        // this theme currently used for HomeButtonNav only
        // if other TextButtons are used, it will need to be extracted
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            shape:
                MaterialStateProperty.all<OutlinedBorder>(const CircleBorder()),
            foregroundColor: MaterialStateProperty.all<Color>(_onBackground),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered))
                  return _onSecondary.withOpacity(0.04);
                if (states.contains(MaterialState.focused) ||
                    states.contains(MaterialState.pressed))
                  return _onSecondary.withOpacity(0.12);
                return null; // Defer to the widget's default.
              },
            ),
          ),
        ),
        highlightColor: _secondaryVariant,
        toggleableActiveColor: _secondary);
  }
}
