import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      scaffoldBackgroundColor: Colors.grey[100],
    );
  }

  // Color Palette - Matching Home Screen Hero Section
  static const Color primaryBlue = Color(0xFF81D4FA); // Colors.lightBlue[300] - From home screen gradient
  static const Color primaryBlueSecondary = Color(0xFF42A5F5); // Colors.blue[400] - From home screen gradient
  static const Color primaryBlueDark = Color(0xFF1976D2); // Colors.blue[700]
  
  // Blue Shades for consistent usage
  static const Color blue100 = Color(0xFFBBDEFB);
  static const Color blue200 = Color(0xFF90CAF9);
  static const Color blue300 = Color(0xFF81D4FA); // Same as primaryBlue (lightBlue[300])
  static const Color blue400 = Color(0xFF42A5F5); // Same as primaryBlueSecondary
  static const Color blue500 = Color(0xFF2196F3);
  static const Color blue600 = Color(0xFF1E88E5);
  static const Color blue700 = Color(0xFF1976D2);
  static const Color blue800 = Color(0xFF1565C0);
  
  // Status Colors
  static const Color statusGreen = Color(0xFF4CAF50);
  static const Color statusYellow = Color(0xFFFBC02D);
  static const Color statusOrange = Color(0xFFFF9800);
  static const Color statusRed = Color(0xFFE53935);
  
  // Background Colors
  static const Color backgroundLight = Color(0xFFF5F5F5);
  static const Color backgroundWhite = Color(0xFFFFFFFF);
}

