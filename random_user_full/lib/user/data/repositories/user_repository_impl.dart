import '../datasources/user_random_data_source.dart';
import '../mappers/user_mapper.dart';
import '../models/user_random_model.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRandomDataSource _userRandomDataSource;

  UserRepositoryImpl(this._userRandomDataSource);

  @override
  Future<UserEntity> getUser() async {
    final RandomUser userRandomModel = await _userRandomDataSource
        .getUserRandom();
    return UserMapper.userRandomModelToEntity(userRandomModel);
  }

  @override
  Future<List<UserEntity>> getUsers(int amount) async {
    final List<RandomUser> usersModel = await _userRandomDataSource
        .getUsersRandoms(amount);
    return usersModel
        .map((user) => UserMapper.userRandomModelToEntity(user))
        .toList();
  }
}
