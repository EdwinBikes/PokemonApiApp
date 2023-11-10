import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverapp/config/config.dart';

//final randomNameProvider = StateProvider.autoDispose<String>((ref) { este autodispose, lo que hace es eliminar el nombre cada que se llama, el codigo de abajo lo que hace es mantener los datos si no se vuelve a llamar la funsion
final randomNameProvider = StateProvider<String>((ref) {
  return RandomGenerator.getRandomName();
});
