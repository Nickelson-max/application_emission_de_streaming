import 'diffusion.dart';

/// Modelle qui représente une émission avec un identifiant, un nom, une chaîne de radio, un chemin d'image et une liste de diffusions
class Emission {
  final String id;
  final String nom;
  final String chaineRadio;
  final String imagePath;
  final List<Diffusion> diffusions;

  Emission({
    required this.id,
    required this.nom,
    required this.chaineRadio,
    required this.imagePath,
    required this.diffusions,
  });
}