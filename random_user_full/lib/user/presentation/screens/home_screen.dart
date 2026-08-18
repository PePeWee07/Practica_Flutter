import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/di/service_locator.dart';
import '../../domain/usecases/get_random_user.dart';
import '../bloc/user_bloc.dart';
import '../widgets/one_user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          UserBloc(serviceLocator<GetRandomUser>())..add(const UserRequested()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Usuario',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 19),
          ),
        ),
        body: const SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Primer Usuario', style: TextStyle(fontSize: 20)),
                OneRandomUser(),
                Divider(),
                Text('Lista de Usuarios', style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
