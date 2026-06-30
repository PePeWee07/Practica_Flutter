import 'package:flutter/material.dart';

class VideoGradientBackground extends StatelessWidget {
  final List<Color> colors;
  final List<double> stops;

  const VideoGradientBackground({
    super.key,
    this.colors = const [Colors.transparent, Colors.black],
    this.stops = const [0.5, 1.0],
  }) : assert(
         colors.length == stops.length,
         "Stops deber ser igual a los colores",
       );

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            stops: stops,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
