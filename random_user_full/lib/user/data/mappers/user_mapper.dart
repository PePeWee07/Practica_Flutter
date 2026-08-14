import 'package:random_user_full/user/data/models/user_random_model.dart';
import 'package:random_user_full/user/domain/entities/user_entity.dart';

class UserMapper {
  static UserEntity userRandomModelToEntity(RandomUser user) => UserEntity(
    id: user.login.uuid,
    firstName: user.name.first,
    lastName: user.name.last,
    gender: user.gender,
    email: user.email,
    accountName: user.login.username,
    pass: user.login.password,
    movilPhone: user.phone,
    avatarUrl: user.picture.large,
    city: user.location.city,
    country: user.location.country,
  );
}
