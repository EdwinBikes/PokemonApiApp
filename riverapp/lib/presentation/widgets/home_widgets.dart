import 'package:flutter/material.dart';

class HomeWidgets extends StatelessWidget {
  const HomeWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: const [
        Text('hello'),
        Text('helloss'),
        Text('helloasad'),
        Text('helloasdas')
      ],
    );
  }
}
