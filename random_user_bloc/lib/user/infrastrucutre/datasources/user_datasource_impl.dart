import 'package:dio/dio.dart';
import 'package:random_user_bloc/user/domain/datasources/user_datasource.dart';
import 'package:random_user_bloc/user/domain/entities/my_user.dart';
import 'package:random_user_bloc/user/infrastrucutre/mappers/user_mapper.dart';
import 'package:random_user_bloc/user/infrastrucutre/models/radom_data.dart';
import 'package:random_user_bloc/user/infrastrucutre/models/radom_user.dart';

class UserDatasourceImpl implements UserDatasource {
  final _dio = Dio();

  @override
  Future<MyUser> getUserRandom() async {
    final resp = await _dio.get('https://randomuser.me/api/');

    final RandomData randomData = RandomData.fromJson(resp.data);
    final List<RandomUser> userRandomList = randomData.results;

    final user = userRandomList.map(
      (user) => UserMapper.randomUserToEntity(user),
    ).toList();

    return user.first;
  }
}
