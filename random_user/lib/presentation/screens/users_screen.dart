import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user/presentation/screens/user_detail_screen.dart';
import 'package:random_user/providers/users_provider.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usersProvider = context.watch<UsersProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Users')),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_outlined),
            onPressed: () => context.read<UsersProvider>().loadUser(),
          ),
        ],
      ),
      body: _buildBody(usersProvider),
    );
  }

  Widget _buildBody(UsersProvider usersProvider) {
    if (usersProvider.isLoading) {
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
    } else if (usersProvider.errorMessage != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 60),
            const SizedBox(height: 16),
            Text('Error: ${usersProvider.errorMessage}'),
          ],
        ),
      );
    } else {
      final users = usersProvider.users;

      return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text('$index ${user.firstName}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => UserDetailScreen(user: user)),
              );
            },
          );
        },
      );
    }
  }
}
