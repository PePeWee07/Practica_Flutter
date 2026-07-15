import 'package:random_user_bloc/user/domain/entities/my_user.dart';

abstract class UserDatasource {

  Future<MyUser> getUserRandom();
  
}