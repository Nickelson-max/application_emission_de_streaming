import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../controllers/emission_controller.dart';
import 'carte_emission.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  final EmissionController controller;

  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final emissions = controller.getEmissions();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vos émissions en streaming'),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.list)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ResponsiveGridList(
          desiredItemWidth: 160,
          minSpacing: 10,
          children: emissions.map((emission) {
            return CarteEmission(
              emission: emission,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(emission: emission),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Recherche'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}