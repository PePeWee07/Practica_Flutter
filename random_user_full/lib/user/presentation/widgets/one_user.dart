import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc.dart';

class OneRandomUser extends StatelessWidget {
  const OneRandomUser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (BuildContext context, UserState state) {
        return switch (state) {
          UserInitial() ||
          UserLoading() => const Center(child: CircularProgressIndicator()),
          UserLoaded(:final user) => Text('${user.firstName} ${user.lastName}'),
          UserError(:final message) => Center(child: Text(message)),
        };
      },
    );
  }
}
