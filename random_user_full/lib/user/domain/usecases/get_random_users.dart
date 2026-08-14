import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class GetRandomUsers {
  final UserRepository _repository;

  const GetRandomUsers(this._repository);

  Future<List<UserEntity>> call(int amount) => _repository.getUsers(amount);
}
