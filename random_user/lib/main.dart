import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user/presentation/screens/user_screen.dart';
import 'package:random_user/presentation/screens/users_screen.dart';
import 'package:random_user/providers/users_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UsersProvider())],
      child: const MaterialApp(
        title: 'Random User',
        debugShowCheckedModeBanner: false,
        home: UsersScreen(),
      ),
    );
  }
}
