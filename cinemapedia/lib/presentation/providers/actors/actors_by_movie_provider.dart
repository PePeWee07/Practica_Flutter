import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/legacy.dart';

final actorMyMoviProvider =
    StateNotifierProvider<ActorMapNotifier, Map<String, List<Actor>>>((ref) {
      final actorRepository = ref
          .watch(actorsRepositoryProvider)
          .getActorsByMovie;
      return ActorMapNotifier(getActors: actorRepository);
    });

/*
Ejemplo del estado a Optener
  {
  '389298': <Actor>(),
  '389242': <Actor>(),
  '232432': <Actor>(),
  }
*/

typedef GetActorCallback = Future<List<Actor>> Function(String movieId);

class ActorMapNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorCallback getActors;

  ActorMapNotifier({required this.getActors}) : super({});

  Future<void> loadActor(String movieId) async {
    // No volver cargar el mismo actor
    if (state[movieId] != null) return;

    final List<Actor> actors = await getActors(movieId);
    state = {...state, movieId: actors};
  }
}
