import 'package:dio/dio.dart';
import 'package:random_user_full/user/data/datasources/user_random_data_source.dart';
import 'package:random_user_full/user/data/models/user_random_model.dart';

class UserRandomDataSourceImpl implements UserRandomDataSource {
  final _dio = Dio();

  @override
  Future<RandomUser> getUserRandom() async {
    final resp = await _dio.get('https://randomuser.me/api/');

    final UserRandomModel randomData = UserRandomModel.fromJson(resp.data);
    final List<RandomUser> userRandomList = randomData.results;
    return userRandomList.first;
  }

  @override
  Future<List<RandomUser>> getUsersRandoms(int amount) async {
    final resp = await _dio.get('https://randomuser.me/api/?results=$amount');

    return resp.data.results;

  }
}
