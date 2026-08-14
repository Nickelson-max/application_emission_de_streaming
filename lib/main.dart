import 'package:flutter/material.dart';
import 'controllers/emission_controller.dart';
import 'views/home_page.dart';

void main() {
  runApp(const MonApplication());
}

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    // j'instancie le controller pour l'envoyer à la page principale
    final EmissionController controller = EmissionController();

    return MaterialApp(
      title: 'Emissions Streaming - MVC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      //j'envoie le  Controller vers la page principale 
      home: HomePage(controller: controller),
    );
  }
}