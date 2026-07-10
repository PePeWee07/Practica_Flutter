import '../../presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouer = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/cubits',
      builder: (context, state) => const CubirCounterScreen(),
    ),
    GoRoute(
      path: '/bloc',
      builder: (context, state) => const BlocCounterScreen(),
    ),
    GoRoute(
      path: '/new-user',
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);
