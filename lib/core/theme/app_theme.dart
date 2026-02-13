import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      scaffoldBackgroundColor: Colors.grey[100],
    );
  }

  // Color Palette
  static const Color primaryBlue = Color(0xFF64B5F6); // Colors.blue[300]
  static const Color primaryBlueDark = Color(0xFF1976D2); // Colors.blue[700]
  
  // Status Colors
  static const Color statusGreen = Color(0xFF4CAF50);
  static const Color statusYellow = Color(0xFFFBC02D);
  static const Color statusOrange = Color(0xFFFF9800);
  static const Color statusRed = Color(0xFFE53935);
  
  // Background Colors
  static const Color backgroundLight = Color(0xFFF5F5F5);
  static const Color backgroundWhite = Color(0xFFFFFFFF);
}

