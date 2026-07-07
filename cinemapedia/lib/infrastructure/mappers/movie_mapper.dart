import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: (moviedb.backdropPath != '')
        ? 'https://image.tmdb.org/t/p/w500/${moviedb.backdropPath}'
        : 'https://cdn.displate.com/artwork/857x1200/2024-04-10/ec27e01e31a774ab9a168d922d07c33e_ff36b6b0233da0913042c802de7948e5.jpg',
    genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: (moviedb.posterPath != '')
        ? 'https://image.tmdb.org/t/p/w500/${moviedb.posterPath}'
        : 'no-poster',
    // releaseDate: moviedb.releaseDate != null ? moviedb.releaseDate! :  DateTime.now(),
    releaseDate: moviedb.releaseDate ?? DateTime.now(),
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );

  static Movie movieDetailsToEntity(MovieDetails moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: (moviedb.backdropPath != '')
        ? 'https://image.tmdb.org/t/p/w500/${moviedb.backdropPath}'
        : 'https://cdn.displate.com/artwork/857x1200/2024-04-10/ec27e01e31a774ab9a168d922d07c33e_ff36b6b0233da0913042c802de7948e5.jpg',
    genreIds: moviedb.genres.map((e) => e.name).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: (moviedb.posterPath != '')
        ? 'https://image.tmdb.org/t/p/w500/${moviedb.posterPath}'
        : 'https://cdn.displate.com/artwork/857x1200/2024-04-10/ec27e01e31a774ab9a168d922d07c33e_ff36b6b0233da0913042c802de7948e5.jpg',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );
}
