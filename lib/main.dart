import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawflix/theme/app_colors.dart';

import 'pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rawflix',
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: AppColours.primaryBackground,
      ),
      home: const HomeScreen(),
    );
  }
}
