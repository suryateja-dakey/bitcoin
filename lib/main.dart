import 'package:flutter/material.dart';
import 'price_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData.dark().copyWith(
          primaryColor: Color.fromARGB(255, 0, 0, 0),
          scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0)),
      home: PriceScreen(),
    );
  }
}