import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:example_provider_and_statefull/providers/counter_provider.dart';
import 'package:example_provider_and_statefull/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ChangeNotifierProvider envuelve TODA la app.
    // Al ponerlo aquí arriba, el CounterProvider queda disponible para
    // CUALQUIER pantalla hija (Home, Second, las que sea). Por eso es "global".
    //
    // Si tuvieras varios providers, usarías MultiProvider con una lista.
    return ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: MaterialApp(
        title: 'Provider vs StatefulWidget',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
