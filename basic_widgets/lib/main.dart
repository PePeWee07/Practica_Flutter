import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: _MyAppBar(),
        ),
        body: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.amber[300],
            borderRadius: const BorderRadius.all(Radius.circular(5.2)),
          ),
          child: const Center(child: Text('Hello, World!')),
        ),
        bottomNavigationBar: const _MyBottomAppBar(),
      ),
    );
  }
}

class _MyBottomAppBar extends StatelessWidget {
  const _MyBottomAppBar();
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.cyan[300],
      elevation: 140.0,
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      clipBehavior: Clip.antiAlias,
      surfaceTintColor: Colors.red,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 150),
      shadowColor: Colors.blue,
      height: 120,
      child: const SizedBox(
        height: 50,
        child: Center(child: Text('bottomNavigationBar')),
      ),
    );
  }
}

class _MyAppBar extends StatelessWidget {
  const _MyAppBar();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Title Here'),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(icon: const Icon(Icons.menu), onPressed: () {});
        },
      ),
      actions: const <Widget>[
        Column(children: <Widget>[_MyWidget(), _MyWidget2()]),
      ],
    );
  }
}

class _MyWidget extends StatelessWidget {
  const _MyWidget();
  @override
  Widget build(BuildContext context) {
    return const Text('Widget content 1');
  }
}

class _MyWidget2 extends StatelessWidget {
  const _MyWidget2();
  @override
  Widget build(BuildContext context) {
    return const Text('Widget content 2');
  }
}
