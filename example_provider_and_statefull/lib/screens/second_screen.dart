import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:example_provider_and_statefull/providers/counter_provider.dart';

/// Otra pantalla, OTRA parte del árbol de widgets.
/// Aun así lee y modifica EL MISMO contador global, porque el provider
/// está registrado arriba de todo (en main.dart). Esto es lo que NO podrías
/// hacer con un setState: ese estado quedaría atrapado en su pantalla.
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = context.watch<CounterProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('2da pantalla'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Mismo contador global, otra pantalla:'),
            Text('${counterProvider.counter}',
                style: const TextStyle(fontSize: 64)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(
                  icon: const Icon(Icons.remove),
                  onPressed: () =>
                      context.read<CounterProvider>().decrement(),
                ),
                const SizedBox(width: 12),
                IconButton.filled(
                  icon: const Icon(Icons.add),
                  onPressed: () =>
                      context.read<CounterProvider>().increment(),
                ),
              ],
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () => context.read<CounterProvider>().reset(),
              child: const Text('Reset global'),
            ),
            const SizedBox(height: 12),
            const Text(
              'Cambia el valor aquí y vuelve atrás:\n'
              'verás el cambio reflejado en la pantalla anterior.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
