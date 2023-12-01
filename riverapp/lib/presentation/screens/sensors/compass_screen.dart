import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverapp/presentation/presentation.dart';

class CompassScreen extends ConsumerWidget {
  const CompassScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final accelerometer$ = ref.watch(accelerometerGravityProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('CompassScreen'),
        ),
        body: Center(
          child: accelerometer$.when(
              data: (value) => Text(
                    value.toString(),
                    style: const TextStyle(fontSize: 25),
                  ),
              error: (error, stackTrace) => Text('tenemos este error: $error'),
              loading: () => const CircularProgressIndicator()),
        ));
  }
}
