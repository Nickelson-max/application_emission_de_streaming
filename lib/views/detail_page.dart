import 'package:flutter/material.dart';
import '../models/emission.dart';

class DetailPage extends StatelessWidget {
  final Emission emission;

  const DetailPage({super.key, required this.emission});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Hero(
            tag: emission.id,
            child: Image.asset(
              emission.imagePath,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 250,
                color: Colors.deepPurple,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.deepPurple,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  emission.nom,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  emission.chaineRadio,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: emission.diffusions.length,
              itemBuilder: (context, index) {
                final item = emission.diffusions[index];
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(item.title),
                      const SizedBox(width: 10),
                      const Icon(Icons.volume_up),
                      const SizedBox(width: 20),
                      Text(item.date),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}