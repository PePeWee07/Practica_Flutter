import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_user_bloc/user/infrastrucutre/datasources/user_datasource_impl.dart';
import 'package:random_user_bloc/user/infrastrucutre/repositories/user_repository_impl.dart';
import 'package:random_user_bloc/user/presentation/bloc/user_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              UserBloc(userRepository: UserRepositoryImpl(UserDatasourceImpl()))
                ..add(LoadRandomUser()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Usuario',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 19),
          ),
        ),
        body: Center(child: Column(children: [OneRandomUser()])),
      ),
    );
  }
}

class OneRandomUser extends StatelessWidget {
  const OneRandomUser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.status == UserStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.status == UserStatus.error) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        }
        if (state.status != UserStatus.loaded) {
          return const Center(child: Text('Sin datos'));
        }
        return Text(state.user!.firstName);
      },
    );
  }
}
