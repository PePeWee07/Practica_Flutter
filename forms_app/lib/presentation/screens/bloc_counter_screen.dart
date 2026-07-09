import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const BlocCounterView(),
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final eventIncrement = context.read<CounterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Counter ${eventIncrement.state.trasactionCount}'),
        actions: [
          IconButton(
            onPressed: () => {eventIncrement.add(const CounterReset())},
            icon: const Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: Center(
        child: context.select(
          (CounterBloc value) => Text(
            'Counter BLoC: ${value.state.counter}',
            style: const TextStyle(fontSize: 25),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 3,
            child: const Text('+3'),
            onPressed: () => {eventIncrement.add(const CounterIncreased(3))},
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 2,
            child: const Text('+2'),
            onPressed: () => {eventIncrement.add(const CounterIncreased(2))},
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 1,
            child: const Text('+1'),
            onPressed: () => {eventIncrement.increaseBy(1)},
          ),
        ],
      ),
    );
  }
}
