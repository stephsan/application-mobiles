import 'package:brave/pages/home_page.dart';
import 'package:brave/pages/loadding_page.dart';
import 'package:brave/providers/devis.dart';
import 'package:brave/providers/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ItemProvider()),
      ChangeNotifierProvider(create: (context) => DevisProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyLoadingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
