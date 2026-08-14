import 'package:dio/dio.dart';
import 'user_random_data_source.dart';
import '../models/user_random_model.dart';

const String _baseUrl = 'https://randomuser.me/api/';

class UserRandomDataSourceImpl implements UserRandomDataSource {
  // final _dio = Dio();
  final Dio _dio;

  const UserRandomDataSourceImpl(this._dio);

  Future<List<RandomUser>> _fetchUsers(String url) async {
    final resp = await _dio.get<Map<String, dynamic>>(url);

    final data = resp.data;
    if (data == null) {
      throw const FormatException('No Body for user.');
    }

    final UserRandomModel randomData = UserRandomModel.fromJson(data);
    return randomData.results;
  }

  @override
  Future<List<RandomUser>> getUsersRandoms(int amount) =>
      _fetchUsers('$_baseUrl?results=$amount');

  @override
  Future<RandomUser> getUserRandom() async {
    final users = await _fetchUsers(_baseUrl);
    return users.first;
  }

  // ====== Forma basica =====
  // @override
  // Future<RandomUser> getUserRandom() async {
  //   final resp = await _dio.get<Map<String, dynamic>>(
  //     'https://randomuser.me/api/',
  //   );

  //   final data = resp.data;
  //   if (data == null) {
  //     throw const FormatException('No Body for user.');
  //   }

  //   final UserRandomModel randomData = UserRandomModel.fromJson(data);
  //   final List<RandomUser> userRandomList = randomData.results;
  //   return userRandomList.first;
  // }

  // @override
  // Future<List<RandomUser>> getUsersRandoms(int amount) async {
  //   final resp = await _dio.get<Map<String, dynamic>>(
  //     'https://randomuser.me/api/?results=$amount',
  //   );

  //   final data = resp.data;
  //   if (data == null) {
  //     throw const FormatException('No Body for users.');
  //   }

  //   final UserRandomModel randomData = UserRandomModel.fromJson(data);
  //   return randomData.results;
  // }
}
