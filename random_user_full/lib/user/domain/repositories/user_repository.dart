import 'package:random_user_full/user/domain/entities/user_entity.dart';

abstract interface class UserRepository {
  Future<UserEntity> getUser();
  Future<List<UserEntity>> getUsers(int amount);
}
