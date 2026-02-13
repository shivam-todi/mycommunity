import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/navigation/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Community',
      theme: AppTheme.lightTheme,
      home: const MainScreen(),
    );
  }
}
