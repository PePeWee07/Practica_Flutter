import 'package:flutter/material.dart';
import 'package:random_user/domain/entities/user.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;
  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final fullname = '${user.firstName} ${user.lastName}';

    return Scaffold(
      appBar: AppBar(title: Text(fullname)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                user.pictureUrl,
                width: 180,
                height: 180,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.person, size: 180);
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(fullname, style: Theme.of(context).textTheme.titleLarge),
            Text('id: ${user.id}'),
            Text('email: ${user.email}'),
            Text('phone: ${user.phone}'),
            Text('city: ${user.city}'),
            Text('country: ${user.country}'),
          ],
        ),
      ),
    );
  }
}
