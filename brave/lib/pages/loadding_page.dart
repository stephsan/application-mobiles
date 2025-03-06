import 'dart:async';

import 'package:brave/pages/home_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyLoadingPage extends StatefulWidget {
  MyLoadingPage({super.key});
  @override
  State<StatefulWidget> createState() => _MyLoadingPageState();
}

class _MyLoadingPageState extends State<MyLoadingPage> {
  // Lorsque la page est initialisé par initState appelle la fonction
  // loadAnimation qui charge l'animation pendant 3 secondes et charge le homePage
  @override
  void initState() {
    super.initState();
    loadAnimation();
  }

  //Definition de la durée de la page d'animation
  Future<Timer> loadAnimation() async {
    return Timer(const Duration(seconds: 3), onLoaded);
  }

  //Apres chargement de la page d'animation la remplacer la la homePage
  onLoaded() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => MyHomePage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Lottie.asset(
        'assets/lotties/loadding.json', // Chemin vers votre animation
        width: 300,
        height: 300,
        repeat: false, // Animation en boucle
      ),
    ));
  }
}
