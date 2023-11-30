import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverapp/presentation/presentation.dart';

class TodosScreen extends ConsumerWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de invitados'),
      ),
      body: const _TodosView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        child: const Icon(
          Icons.add,
          color: Colors.red,
        ),
        onPressed: () {
          ref.read(todosProvider.notifier).addTodo();
        },
      ),
    );
  }
}

class _TodosView extends ConsumerWidget {
  const _TodosView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider);

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[
            index]; // sirve para mantener la refenecia del todo, mas no consume memoria

        return SwitchListTile(
            title: Text(
              todo.description,
              style: GoogleFonts.blackOpsOne(fontSize: 25, color: Colors.cyan),
            ),
            value: todo.done,
            onChanged: (value) {},
            activeColor: Colors.red);
      },
    );
  }
}
