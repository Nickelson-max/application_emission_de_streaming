import 'dart:math';

// model Diffusion: represente une diffusion avec un titre et une date
class Diffusion {
  final String title;
  final String date;

  Diffusion({
    required this.title,
    required this.date,
  });

  // methode statique pour générer une liste de diffusions aléatoires 
  static List<Diffusion> generateRandomDiffusions({int count = 5}) {
    final random = Random();
    List<Diffusion> list = [];
    for (int i = 1; i <= count; i++) {
      int year = 2023;
      int month = random.nextInt(9) + 1;
      int day = random.nextInt(25) + 1;
      list.add(
        Diffusion(
          title: 'Diffusion $i',
          date: 'Date: $year-$month-$day',
        ),
      );
    }
    return list;
  }
}