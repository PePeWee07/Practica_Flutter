import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/legacy.dart';

final movieInfoProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
      final movieRepository = ref.watch(movieRepositoryProvider).getMovieId;
      return MovieMapNotifier(getMovie: movieRepository);
    });

/*
Ejemplo del estado a Optener
  {
  '389298': Movie(),
  '389242': Movie(),
  '232432': Movie(),
  }
*/

typedef GetMovieCallback = Future<Movie> Function(String moviId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback getMovie;

  MovieMapNotifier({required this.getMovie}) : super({});

  Future<void> loadMovie(String movieId) async {
    // No volver cargar las misma movie
    if (state[movieId] != null) return;

    final movie = await getMovie(movieId);

    state = {...state, movieId: movie};
  }
}
