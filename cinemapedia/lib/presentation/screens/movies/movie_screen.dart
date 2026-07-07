import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  static const name = 'movie-screen';
  final String moveId;

  const MovieScreen({super.key, required this.moveId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('MovieID: $moveId')));
  }
}
