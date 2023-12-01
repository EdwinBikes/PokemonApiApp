import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverapp/presentation/presentation.dart';

class GyroscopeScreen extends ConsumerWidget {
  const GyroscopeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final gyroscope$ = ref.watch(gyroscopeProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Giroscopio'),
        ),
        body: Center(
          child: gyroscope$.when(
              data: (value) => Text(
                    value.toString(),
                    style: const TextStyle(fontSize: 25),
                  ),
              error: (error, stackTrace) => Text('tenemos este error: $error'),
              loading: () => const CircularProgressIndicator()),
        ));
  }
}
