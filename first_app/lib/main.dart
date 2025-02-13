import 'package:flutter/material.dart';
import 'package:first_app/pages/home_page.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
