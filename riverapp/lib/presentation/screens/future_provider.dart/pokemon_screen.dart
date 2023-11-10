import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverapp/presentation/presentation.dart';

class PokemonScreen extends ConsumerWidget {
  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonAsync = ref.watch(pokemonNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('pokemon'),
      ),
      body: Center(
          child: pokemonAsync.when(
              data: (value) => Text(value),
              error: (error, stackTrace) => Text('Error: $error'),
              loading: () => const CircularProgressIndicator())),
    );
  }
}
