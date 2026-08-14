import 'package:random_user_full/user/data/datasources/user_random_data_source.dart';
import 'package:random_user_full/user/data/mappers/user_mapper.dart';
import 'package:random_user_full/user/data/models/user_random_model.dart';
import 'package:random_user_full/user/domain/entities/user_entity.dart';
import 'package:random_user_full/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRandomDataSource userRandomDataSource;

  UserRepositoryImpl({required this.userRandomDataSource});

  @override
  Future<UserEntity> getUser() async {
    final RandomUser userRandomModel = await userRandomDataSource
        .getUserRandom();
    return UserMapper.userRandomModelToEntity(userRandomModel);
  }

  @override
  Future<List<UserEntity>> getUsers(int amount) async {
    final List<RandomUser> usersModel = await userRandomDataSource
        .getUsersRandoms(amount);
    return usersModel.map( (user) => UserMapper.userRandomModelToEntity(user)).toList();
  }
}
