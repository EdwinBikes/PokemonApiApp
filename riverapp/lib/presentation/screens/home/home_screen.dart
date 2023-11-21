import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    return ListView(
      children: const [
        _CustomListTile(
          title: "Nombres Aleatorios",
          subTitle: "State provider",
          location: "/state-provider",
        ),
        _CustomListTile(
          title: "Nombres Pokemons API",
          subTitle: "Future Provider",
          location: "/future-provider",
        ),
        _CustomListTile(
          title: "Nombres de personas Random",
          subTitle: "Stream provider",
          location: "/stream-provider",
        ),
        _CustomListTile(
          title: "State notifier Provider",
          subTitle: "State provider personalizado",
          location: "/state-notifier-provider",
        ),
        _CustomListTile(
          title: "Permisos de la aplicacion",
          subTitle: "Solicitar permisos (cámara),(gps),(bluetooth)...",
          location: "/permissions-screen",
        ),
        ListTile(
          leading: Icon(Icons.web_stories_outlined),
          title: Text('Edwin Bikes',
              style: TextStyle(fontSize: 14, color: Colors.black)),
          subtitle: Text('Sigueme en mis Redes',
              style: TextStyle(fontSize: 12, color: Colors.grey)),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
        )
      ],
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String location;
  const _CustomListTile(
      {required this.title, required this.subTitle, required this.location});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () => context.push(location),
    );
  }
}
