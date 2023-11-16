import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverapp/presentation/presentation.dart';

class PokemonScreen extends ConsumerWidget {
  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonId = ref.watch(pokemonIdProvider);

    final pokemonAsync = ref.watch(pokemonNameProvider(pokemonId));

    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon # $pokemonId'),
      ),
      body: Center(
          child: pokemonAsync.when(
              data: (value) => Text(
                    value.toUpperCase(),
                    style: GoogleFonts.pressStart2p(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              error: (error, stackTrace) => Text('Error: $error'),
              loading: () => const CircularProgressIndicator())),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
            heroTag: '1',
            child: const Icon(Icons.plus_one),
            onPressed: () {
              ref.read(pokemonIdProvider.notifier).update((state) => state + 1);
            }),
        const SizedBox(
          height: 10,
        ),
        FloatingActionButton(
            heroTag: '2',
            child: const Icon(Icons.exposure_minus_1),
            onPressed: () {
              ref.read(pokemonIdProvider.notifier).update((state) => state - 1);
            })
      ]),
    );
  }
}
