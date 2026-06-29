import 'package:dio/dio.dart';
import 'package:random_user/domain/entities/user.dart';
import 'package:random_user/infrastructure/model/user_model.dart';

class UserService {
  final _dio = Dio();

  Future<User> getRandomUser() async {
    final resp = await _dio.get('https://randomuser.me/api/');
    final userJson = resp.data['results'][0];

    final UserModel user = UserModel.fromJson(userJson);
    return user.toUserEntity();
  }

  Future<List<User>> getRandomUsers(int numberUsers) async {
    final resp = await _dio.get(
      'https://randomuser.me/api/?results=$numberUsers ',
    );
    final usersJson = resp.data['results'] as List;

    return usersJson
        .map((user) => UserModel.fromJson(user).toUserEntity())
        .toList();
  }
}
