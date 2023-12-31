import 'package:flutter/material.dart';
import 'package:riverapp/presentation/presentation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("riverapp"),
      ),
      body: const _HomeScreenView(),
    );
  }
}

class _HomeScreenView extends StatelessWidget {
  const _HomeScreenView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 16.0), // Ajusta el valor según sea necesario
        child: CustomScrollView(
          slivers: [
            HomeWidgets(),
          ],
        ),
      ),
    );
  }
}
