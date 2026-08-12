import 'dart:math';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

void main() {
  runApp(const MonApplication());
}

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emissions Streaming',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MapremierePage(),
    );
  }
}

class MapremierePage extends StatefulWidget {
  const MapremierePage({super.key});

  @override
  State<MapremierePage> createState() => _MapremierePageState();
}

class _MapremierePageState extends State<MapremierePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vos émissions en streaming'),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.list)),
        ],
      ),
      body: const Center(
        child: PartieGrilleImage(),
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

class PartieGrilleImage extends StatelessWidget {
  const PartieGrilleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
      child: ResponsiveGridList(
        desiredItemWidth: 160,
        minSpacing: 10,
        children: const [
          IdentificationStreaming(
            tagStream: 'doc_1',
            imageStream: 'assets/images/doc.jpg',
            nomStream: 'Documentaires',
            chaineRadio: 'Radio 6',
          ),
          IdentificationStreaming(
            tagStream: 'mode_1',
            imageStream: 'assets/images/mode.jpg',
            nomStream: 'Tendances Mode',
            chaineRadio: 'Radio 3',
          ),
          IdentificationStreaming(
            tagStream: 'crime_1',
            imageStream: 'assets/images/crime.jpg',
            nomStream: 'Enquêtes Criminelles',
            chaineRadio: 'Radio 2',
          ),
          IdentificationStreaming(
            tagStream: 'foot_1',
            imageStream: 'assets/images/foot.jpg',
            nomStream: 'Match de foot',
            chaineRadio: 'Radio 5',
          ),
          IdentificationStreaming(
            tagStream: 'meteo_1',
            imageStream: 'assets/images/meteo.jpg',
            nomStream: 'Streaming Météo',
            chaineRadio: 'Radio 1',
          ),
          IdentificationStreaming(
            tagStream: 'news_1',
            imageStream: 'assets/images/news.jpg',
            nomStream: 'Que des news',
            chaineRadio: 'Radio 4',
          ),
        ],
      ),
    );
  }
}
// Classe Identification Streaming
class IdentificationStreaming extends StatelessWidget {
  final String tagStream;
  final String imageStream;
  final String nomStream;
  final String chaineRadio;

  const IdentificationStreaming({
    super.key,
    required this.tagStream,
    required this.imageStream,
    required this.nomStream,
    required this.chaineRadio,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlbumStreaming(
              tagStream: tagStream,
              imageStream: imageStream,
              nomStream: nomStream,
              chaineRadio: chaineRadio,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: tagStream,
                child: Image.asset(
                  imageStream,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, size: 50),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                key: ValueKey(tagStream),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nomStream,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      chaineRadio,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Classe AlbumStreaming (Page Détails)
class AlbumStreaming extends StatelessWidget {
  final String tagStream;
  final String imageStream;
  final String nomStream;
  final String chaineRadio;

  const AlbumStreaming({
    super.key,
    required this.tagStream,
    required this.imageStream,
    required this.nomStream,
    required this.chaineRadio,
  });

  // Generateur date aleatoire pour les diffusions
  List<Map<String, String>> _generateRandomDiffusions() {
    final random = Random();
    List<Map<String, String>> list = [];
    for (int i = 1; i <= 5; i++) {
      int year = 2023;
      int month = random.nextInt(9) + 1;
      int day = random.nextInt(25) + 1;
      list.add({
        'title': 'Diffusion $i',
        'date': 'Date: $year-$month-$day',
      });
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final diffusions = _generateRandomDiffusions();

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
          Stack(
            children: [
              Hero(
                tag: tagStream,
                child: Image.asset(
                  imageStream,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 250,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            color: Colors.deepPurple,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nomStream,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  chaineRadio,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: diffusions.length,
              itemBuilder: (context, index) {
                final item = diffusions[index];
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(item['title']!),
                      const SizedBox(width: 10),
                      const Icon(Icons.volume_up),
                      const SizedBox(width: 20),
                      Text(item['date']!),
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