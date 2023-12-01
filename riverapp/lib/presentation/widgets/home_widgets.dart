import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final String route;

  MenuItem({required this.title, required this.icon, required this.route});
}

final menuItems = <MenuItem>[
  MenuItem(title: 'Pokemons API', icon: Icons.adb, route: '/future-provider'),
  MenuItem(
      title: 'Nombres Aleatorios', icon: Icons.abc, route: '/state-provider'),
  MenuItem(
      title: 'Nombres Automaticos',
      icon: Icons.logo_dev_outlined,
      route: '/stream-provider'),
  MenuItem(
      title: 'State notifier Provider',
      icon: Icons.ac_unit_rounded,
      route: '/state-notifier-provider'),
  MenuItem(
      title: 'Permisos de la aplicación',
      icon: Icons.construction,
      route: '/permissions-screen'),
  MenuItem(title: 'Giroscopio', icon: Icons.downloading, route: '/gyroscope'),
  MenuItem(title: 'Acelerometro', icon: Icons.speed, route: '/accelerometer'),
  MenuItem(
      title: 'Magnetometro', icon: Icons.explore_off, route: '/magnetometer'),
  MenuItem(
      title: 'Bola Giroscopio',
      icon: Icons.sports_baseball,
      route: '/gyroscope-ball'),
  MenuItem(title: 'Brújula', icon: Icons.explore, route: '/compass'),
];

class HomeWidgets extends StatelessWidget {
  const HomeWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: menuItems
            .map((item) => HomeMenuItem(
                  title: item.title,
                  icon: item.icon,
                  route: item.route,
                ))
            .toList());
  }
}

class HomeMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;
  final List<Color> bgColors;

  const HomeMenuItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.route,
      this.bgColors = const [Colors.cyan, Colors.purple]});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(route),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                colors: bgColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            icon,
            color: Colors.white,
            size: 35,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          )
        ]),
      ),
    );
  }
}
