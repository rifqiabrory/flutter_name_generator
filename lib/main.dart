import 'package:flutter/material.dart';
import 'package:flutter_names_generator/screens/home_screen.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Names Generators',
      theme: ThemeData(primaryColor: Colors.redAccent),
      home: HomeScreen(),
    );
  }
}
