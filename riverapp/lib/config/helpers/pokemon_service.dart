import 'package:dio/dio.dart';

class PokemonService {
  static Future<Pokemon> getPokemon(int pokemonId) async {
    final dio = Dio();
    await Future.delayed(const Duration(seconds: 1));

    try {
      final response =
          await dio.get('https://pokeapi.co/api/v2/pokemon/$pokemonId');
      final name = response.data['name'] ?? 'Name not found';
      final imageUrl =
          response.data['sprites']['front_default'] ?? 'Image not found';

      return Pokemon(name: name, imageUrl: imageUrl);
    } catch (e) {
      throw 'Pokemon data not found';
    }
  }
}

class Pokemon {
  final String name;
  final String imageUrl;

  Pokemon({required this.name, required this.imageUrl});
}
