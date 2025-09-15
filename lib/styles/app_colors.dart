import 'package:flutter/material.dart';

class AppColors {
  // Shared colors
  static const Color primary =Color(0xFFab7b44);
  static const Color yellow = Color(0xFFFFBD39);
  static const Color pink = Color(0xFFFD456B);
  static const Color black = Color(0xFF212121);
  static const Color blackAlpha = Color(0xFF262626);
  static const Color blackAlpha1 = Color(0xFF2F2D27);
  static const Color gray = Color(0xFF8C8E99);
  static const Color red = Color(0xFFEA4C2D);
  static const Color green = Color(0xFF4CAF50);

  static const Color grayLight = Color(0xFFAAACB6);
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Color(0x00000000);


  static const Color tabIndicatorColor=Color(0xff5b5858);


  // Light theme
  static const Color lightBackground = Color(0xFFFFFFFF); // Matches your light mood JSON
  static const Color inputFillLight = white;


  // Dark theme
  static const Color darkBackground = Color(0xFF1E1E1E);
  static const Color inputFillDark = Color(0xFF2D2D2D);
    static const Color borderDark = Color(0xFF3E3E3E);
  static const Color border2 = Color(0xFF949393);


  // Borders and neutral colors
  static const Color btnLightBorder = Color(0xFFE8E8E8);

  static const Color btnDarkBorder = Color(0xFF626262);
  static const Color textGray = Color(0xFF999999);
  static const Color textBlack = Color(0xFF212121);
  static const Color btnBorder = Color(0xFF626262);


  static const Color hintText = Color(0xFFAAACB6);
  static const Color containerBgLight = Color(0xFFab7b44);









  static const Color splashBg=Color(0xFF999999);




  // Gradients
  static const LinearGradient mainGradient = LinearGradient(
    colors: [Color(0xFFB28F47), Color(0xFF2C2E30)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFFA7648D), Color(0xFF6A6A4A)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static var containerBgDark;
}
