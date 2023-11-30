import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverapp/config/config.dart';

final pokemonIdProvider = StateProvider<int>((ref) {
  return 1;
});

final pokemonProvider = FutureProvider.family<Pokemon, int>((ref, id) async {
  final pokemon = await PokemonService.getPokemon(id);
  return pokemon;
});
