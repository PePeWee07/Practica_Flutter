import 'package:random_user_bloc/user/domain/datasources/user_datasource.dart';
import 'package:random_user_bloc/user/domain/entities/my_user.dart';
import 'package:random_user_bloc/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource datasource;

  UserRepositoryImpl(this.datasource);

  @override
  Future<MyUser> getUserRandom() => datasource.getUserRandom();
}
