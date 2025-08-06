import 'package:flutter/material.dart';
import 'package:flutter_shopee/features/landing/presenter/pages/landing_screen.dart';
import 'package:flutter_shopee/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: LandingScreen(),
    );
  }
}
