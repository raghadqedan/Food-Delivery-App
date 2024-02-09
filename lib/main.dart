import 'package:flutter/material.dart';
import 'package:food_delivary_app/views/pages/custom_bottom_navbar.dart';
import 'package:food_delivary_app/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home:  const CustomButtomNavbar(),
    );
  }
}
