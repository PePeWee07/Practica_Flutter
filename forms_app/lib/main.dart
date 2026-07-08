import 'package:flutter/material.dart';
import 'package:forms_app/config/router/app_routers.dart';
import 'package:forms_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouer,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      // home: const Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
