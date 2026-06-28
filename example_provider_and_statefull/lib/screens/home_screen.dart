import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:example_provider_and_statefull/providers/counter_provider.dart';
import 'package:example_provider_and_statefull/screens/second_screen.dart';

/// La pantalla es STATELESS. El cuerpo sí necesita estado local (el switch
/// que muestra/oculta las tarjetas), así que ese estado vive en _HomeBody.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // watch() en el AppBar: hasta el título reacciona al estado global.
    final counterProvider = context.watch<CounterProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Provider vs StatefulWidget'),
        actions: [
          Center(child: Text('Global: ${counterProvider.counter}')),
          const SizedBox(width: 16),
        ],
      ),
      body: const _HomeBody(),
    );
  }
}

/// El cuerpo ES Stateful porque guarda un dato efímero de ESTA pantalla:
/// si las tarjetas están visibles o no. Dato perfecto para setState:
/// no le importa a nadie más y puede perderse sin problema.
class _HomeBody extends StatefulWidget {
  const _HomeBody();

  @override
  State<_HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<_HomeBody> {
  bool _cardsVisible = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Este switch DESTRUYE y RECREA las tarjetas de verdad.
          // Apágalo y enciéndelo: ahí verás reiniciarse el contador local.
          SwitchListTile(
            title: const Text('Tarjetas visibles'),
            subtitle: const Text('Apaga y enciende para destruir/recrear'),
            value: _cardsVisible,
            onChanged: (v) => setState(() => _cardsVisible = v),
          ),
          const SizedBox(height: 12),

          // Cuando _cardsVisible es false, estos widgets salen del árbol
          // (dispose). Al volver, son instancias NUEVAS desde cero.
          if (_cardsVisible) ...[
            const _GlobalCounterCard(),
            const SizedBox(height: 16),
            const _LocalCounter(),
          ] else
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Text('🗑️ tarjetas destruidas'),
            ),

          const SizedBox(height: 24),
          FilledButton.icon(
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Ir a la 2da pantalla'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SecondScreen()),
              );
            },
          ),
          const SizedBox(height: 12),
          const Text(
            'Navegar NO reinicia el local (la pantalla sigue viva debajo).\n'
            'Apagar el switch SÍ lo reinicia: ahí el widget se destruye.\n'
            'El global se conserva siempre: vive en el Provider, no en el widget.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

/// TARJETA 1 — ESTADO GLOBAL (Provider).
/// Stateless, pero muestra/modifica un contador que vive en el Provider.
/// Aunque la destruyas con el switch, al recrearla el valor sigue ahí:
/// porque el dato nunca vivió en esta tarjeta.
class _GlobalCounterCard extends StatelessWidget {
  const _GlobalCounterCard();

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterProvider>().counter;

    return Card(
      color: Colors.deepPurple.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('🌍 GLOBAL (Provider)',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('$counter', style: const TextStyle(fontSize: 48)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(
                  icon: const Icon(Icons.remove),
                  // read() = leo SIN suscribirme, solo para llamar al método.
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
          ],
        ),
      ),
    );
  }
}

/// TARJETA 2 — ESTADO LOCAL (StatefulWidget).
/// El contador vive DENTRO de este State. Si el widget se destruye
/// (al apagar el switch), su estado muere con él y vuelve a 0 al recrearse.
class _LocalCounter extends StatefulWidget {
  const _LocalCounter();

  @override
  State<_LocalCounter> createState() => _LocalCounterState();
}

class _LocalCounterState extends State<_LocalCounter> {
  int _localCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('📍 LOCAL (StatefulWidget)',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('$_localCounter', style: const TextStyle(fontSize: 48)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (_localCounter == 0) return;
                    setState(() => _localCounter--);
                  },
                ),
                const SizedBox(width: 12),
                IconButton.filled(
                  icon: const Icon(Icons.add),
                  onPressed: () => setState(() => _localCounter++),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
