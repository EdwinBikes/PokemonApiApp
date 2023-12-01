import 'package:go_router/go_router.dart';
import 'package:riverapp/presentation/presentation.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/state-provider',
    builder: (context, state) => const StateProviderScreen(),
  ),
  GoRoute(
    path: '/future-provider',
    builder: (context, state) => const PokemonScreen(),
  ),
  GoRoute(
    path: '/stream-provider',
    builder: (context, state) => const StreamScreen(),
  ),
  GoRoute(
    path: '/state-notifier-provider',
    builder: (context, state) => const TodosScreen(),
  ),
  GoRoute(
    path: '/permissions-screen',
    builder: (context, state) => const PermissionsScreen(),
  ),
  GoRoute(
    path: '/gyroscope',
    builder: (context, state) => const GyroscopeScreen(),
  ),
  GoRoute(
    path: '/accelerometer',
    builder: (context, state) => const AccelerometerScreen(),
  ),
  GoRoute(
    path: '/magnetometer',
    builder: (context, state) => const MagnetometerScreen(),
  ),
  GoRoute(
    path: '/compass',
    builder: (context, state) => const CompassScreen(),
  ),
  GoRoute(
    path: '/gyroscope-ball',
    builder: (context, state) => const GyroscopeBallScreen(),
  ),
]);
