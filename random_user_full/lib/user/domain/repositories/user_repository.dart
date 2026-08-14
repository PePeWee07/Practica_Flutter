import '../entities/user_entity.dart';

abstract interface class UserRepository {
  Future<UserEntity> getUser();
  Future<List<UserEntity>> getUsers(int amount);
}
