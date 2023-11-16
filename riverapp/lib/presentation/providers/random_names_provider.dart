import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverapp/config/config.dart';

final namesStreamProvider = StreamProvider.autoDispose<String>((ref) async* {
  // si quiero que el provider deje de cambiar se incluye el .autodispose
  await for (final name in RandomGenerator.randomNamesStream()) {
    yield name;
  }
});



// final namesStreamProvider = StreamProvider<List<String>>((ref) async* {
//   // si queda solo el async regresa un future, con el asterisco reguresa un String
//   yield [];
//   await Future.delayed(const Duration(seconds: 2));

//   yield ['fernando'];
//   await Future.delayed(const Duration(seconds: 2));

//   yield ['edwin', 'bikes'];
//   await Future.delayed(const Duration(seconds: 2));

//   yield ['edwin', 'bikes', 'thebest'];
// });
