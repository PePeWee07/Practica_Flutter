import 'package:flutter/material.dart';
import 'package:random_user/domain/entities/user.dart';
import 'package:random_user/infrastructure/services/user_service.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Randon User')),
      body: FutureBuilder<User>(
        future: UserService().getRandomUser(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Awaiting result...'),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 60),
                  const SizedBox(height: 16),
                  Text('Error: ${snapshot.error}'),
                ],
              ),
            );
          } else if (snapshot.hasData) {
            final user = snapshot.data!;
            return Column(
              children: [
                const Text('USER'),
                CircleAvatar(backgroundImage: NetworkImage(user.pictureUrl)),
                Text('ID: ${user.id}'),
                Text('First Name: ${user.firstName}'),
                Text('Last Name: ${user.lastName}'),
                Text('Email: ${user.email}'),
                Text('Phone: ${user.phone}'),
                Text('City: ${user.city}'),
                Text('Country: ${user.country}'),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
