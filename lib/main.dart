import 'package:flutter/material.dart';
import 'widgets/HomePage/HomePage.widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        dividerTheme: const DividerThemeData(
          space: 20,
          thickness: 1,
          color: Color.fromARGB(255, 191, 247, 247),
          indent: 20,
          endIndent: 20,
        ),
      ),
      home: const Scaffold(
        body: HomePage(),
      ),
    );
  }
}








 
