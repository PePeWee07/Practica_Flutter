import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_app/presentation/bloc/notifications/notifications_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Permission'),
        title: BlocBuilder<NotificationsBloc, NotificationsState>(
          builder: (context, state) {
            return Text(' ${state.status}');
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<NotificationsBloc>().requestPermission();
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final notifications = context
        .watch<NotificationsBloc>()
        .state
        .notifications;

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notificacion = notifications[index];
        return ListTile(
          title: Text(notificacion.title),
          subtitle: Text(notificacion.body),
          leading: notificacion.imageUrl != null ? Image.network('${notificacion.imageUrl}') : null,
        );
      },
    );
  }
}
