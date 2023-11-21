import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverapp/presentation/presentation.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vista de permisos'),
      ),
      body: const _PermissionsView(),
    );
  }
}

class _PermissionsView extends ConsumerWidget {
  const _PermissionsView();

  @override
  Widget build(BuildContext context, ref) {
    return ListView(
      children: [
        CheckboxListTile(
            value: true,
            title: const Text('Cámara'),
            subtitle: const Text('Permisos para usar la camara'),
            onChanged: (value) {}),
        ListTile(
          title: Text(ref.read(appStateProvider.notifier).toString()),
        )
      ],
    );
  }
}
