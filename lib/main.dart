import 'package:custom_painter_practice2/sharingan.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CustomPainterPractice2());
}

class CustomPainterPractice2 extends StatelessWidget {
  const CustomPainterPractice2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.red),
        scaffoldBackgroundColor: Colors.black12,
      ),
      home: Sharingan(),
    );
  }
}
