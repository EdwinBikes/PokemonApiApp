import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverapp/presentation/presentation.dart';

class AccelerometerScreen extends ConsumerWidget {
  const AccelerometerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final accelerometer$ = ref.watch(accelerometerGravityProvider);
    final accelerometerUser$ = ref.watch(accelerometerUserProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('CompassScreen'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Acelerometro CON gravedad',
              style: GoogleFonts.farro(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: accelerometer$.when(
                  data: (value) => Text(
                        value.toString(),
                        style: const TextStyle(fontSize: 25),
                      ),
                  error: (error, stackTrace) =>
                      Text('tenemos este error: $error'),
                  loading: () => const CircularProgressIndicator()),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Acelerometro SIN gravedad'),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: accelerometerUser$.when(
                  data: (value) => Text(
                        value.toString(),
                        style: const TextStyle(fontSize: 25),
                      ),
                  error: (error, stackTrace) =>
                      Text('tenemos este error: $error'),
                  loading: () => const CircularProgressIndicator()),
            ),
          ],
        ));
  }
}
