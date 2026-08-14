import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class GetRandomUser {
  final UserRepository _repository;

  const GetRandomUser(this._repository);

  Future<UserEntity> call() => _repository.getUser();
}
