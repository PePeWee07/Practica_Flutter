import '../models/user_random_model.dart';

abstract interface class UserRandomDataSource {
  Future<RandomUser> getUserRandom();
  Future<List<RandomUser>> getUsersRandoms(int amount);
}
