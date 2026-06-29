import 'package:random_user/domain/entities/user.dart';

class UserModel {
  // Atributos que usarán para el modelo de usuario
  Name name;
  String email;
  String phone;
  Login login;
  Location location;
  Picture picture;

  //constructor
  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.login,
    required this.location,
    required this.picture,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: Name.fromJson(json['name']),
    email: json['email'],
    phone: json['phone'],
    login: Login.fromJson(json['login']),
    location: Location.fromJson(json['location']),
    picture: Picture.fromJson(json['picture']),
  );

  User toUserEntity() => User(
    id: login.uuid,
    firstName: name.first,
    lastName: name.last,
    email: email,
    phone: phone,
    pictureUrl: picture.large,
    city: location.city,
    country: location.country,
  );
}

class Picture {
  String large;

  Picture({required this.large});

  factory Picture.fromJson(Map<String, dynamic> json) =>
      Picture(large: json['large']);

  Map<String, dynamic> toJson() => {'large': large};
}

class Location {
  String city;
  String country;

  Location({required this.city, required this.country});

  factory Location.fromJson(Map<String, dynamic> json) =>
      Location(city: json['city'], country: json['country']);

  Map<String, dynamic> toJson() => {'city': city, 'country': country};
}

class Login {
  String uuid;

  Login({required this.uuid});

  factory Login.fromJson(Map<String, dynamic> json) =>
      Login(uuid: json['uuid']);

  // Como el id comunmente no se edita no creo el toJson()
}

class Name {
  String first;
  String last;

  Name({required this.first, required this.last});

  factory Name.fromJson(Map<String, dynamic> json) =>
      Name(first: json['first'], last: json['last']);

  Map<String, dynamic> toJson() => {'first': first, 'last': last};
}
