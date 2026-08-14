import '../models/emission.dart';
import '../models/diffusion.dart';

/// Contrôleur qui gère les données des émissions
class EmissionController {
  late List<Emission> _emissions;

  EmissionController() {
    loadEmissions();
  }

  // Charge les données simulées 
  void loadEmissions() {
    _emissions = [
      Emission(
        id: 'doc_1',
        nom: 'Documentaires',
        chaineRadio: 'Radio 6',
        imagePath: 'assets/images/doc.jpg',
        diffusions: Diffusion.generateRandomDiffusions(),
      ),
      Emission(
        id: 'mode_1',
        nom: 'Tendances Mode',
        chaineRadio: 'Radio 3',
        imagePath: 'assets/images/mode.jpg',
        diffusions: Diffusion.generateRandomDiffusions(),
      ),
      Emission(
        id: 'crime_1',
        nom: 'Enquêtes Criminelles',
        chaineRadio: 'Radio 2',
        imagePath: 'assets/images/crime.jpg',
        diffusions: Diffusion.generateRandomDiffusions(),
      ),
      Emission(
        id: 'foot_1',
        nom: 'Match de foot',
        chaineRadio: 'Radio 5',
        imagePath: 'assets/images/foot.jpg',
        diffusions: Diffusion.generateRandomDiffusions(),
      ),
      Emission(
        id: 'meteo_1',
        nom: 'Streaming Météo',
        chaineRadio: 'Radio 1',
        imagePath: 'assets/images/meteo.jpg',
        diffusions: Diffusion.generateRandomDiffusions(),
      ),
      Emission(
        id: 'news_1',
        nom: 'Que des news',
        chaineRadio: 'Radio 4',
        imagePath: 'assets/images/news.jpg',
        diffusions: Diffusion.generateRandomDiffusions(),
      ),
    ];
  }

  // Retourne la liste des émissions pour les Vues
  List<Emission> getEmissions() {
    return _emissions;
  }
}