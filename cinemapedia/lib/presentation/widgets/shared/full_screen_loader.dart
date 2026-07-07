import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadMessages() {
    final messages = <String>[
      'Cargando peliculas',
      'Haciendo palomitas',
      'Cargando mas vistas',
      'Cargando Recomendadas',
      'Cargando otras cosas',
    ];

    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere un momento...'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),

          StreamBuilder(
            stream: getLoadMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Caragndo..');
              return Text(snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
}
