import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverapp/config/config.dart';

final pokemonNameProvider = FutureProvider<String>((ref) async {
  final name = await PokemonService.getPokemonName(1);
  return name;
});
