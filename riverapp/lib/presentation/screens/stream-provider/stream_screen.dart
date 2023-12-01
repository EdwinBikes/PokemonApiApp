import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverapp/presentation/presentation.dart';

class StreamScreen extends ConsumerWidget {
  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final randomNames$ = ref.watch(namesStreamProvider);

    if (!randomNames$.hasValue) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Stream Provider')),
      body: randomNames$.when(
          data: (data) => Center(
                child: Text(
                  data,
                  style: GoogleFonts.farro(
                    fontSize: 20,
                  ),
                ),
              ),
          error: ((error, stackTrace) => Text('Error $error')),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
