import 'package:flutter/material.dart';

class MyStetingPage extends StatefulWidget {
  MyStetingPage({super.key});
  @override
  State<StatefulWidget> createState() => _MyStetingPageState();
}

class _MyStetingPageState extends State<MyStetingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Retourner au homePage')),
      ),
    );
  }
}
