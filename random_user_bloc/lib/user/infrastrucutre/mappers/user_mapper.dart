import 'package:random_user_bloc/user/domain/entities/my_user.dart';
import 'package:random_user_bloc/user/infrastrucutre/models/radom_user.dart';

class UserMapper {
  static MyUser randomUserToEntity(RandomUser randonUser) => MyUser(
    id: randonUser.login.uuid,
    firstName: randonUser.name.first,
    lastName: randonUser.name.last,
    email: randonUser.email,
    movilPhone: randonUser.phone,
    avatarUrl: randonUser.picture.medium,
    city: randonUser.location.city,
    country: randonUser.location.country,
    gender: randonUser.gender,
    accountName: randonUser.login.username,
    pass: randonUser.login.username,
  );
}
