class UserRandomModel {
  final List<RandomUser> results;

  const UserRandomModel({required this.results});

  factory UserRandomModel.fromJson(Map<String, dynamic> json) {
    final results = json['results'];
    if (results is! List) {
      throw const FormatException('Random user response is invalid.');
    }
    return UserRandomModel(
      results: results
          .map((item) {
            if (item is! Map<String, dynamic>) {
              throw const FormatException('Random user item is invalid.');
            }
            return RandomUser.fromJson(item);
          })
          .toList(growable: false),
    );
  }
}

class RandomUser {
  final String gender;
  final Name name;
  final Location location;
  final String email;
  final Login login;
  final String phone;
  final Picture picture;

  const RandomUser({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.login,
    required this.phone,
    required this.picture,
  });

  factory RandomUser.fromJson(Map<String, dynamic> json) => RandomUser(
    gender: json['gender']?.toString() ?? '',
    name: Name.fromJson(_objectAt(json, 'name')),
    location: Location.fromJson(_objectAt(json, 'location')),
    email: json['email']?.toString() ?? '',
    login: Login.fromJson(_objectAt(json, 'login')),
    phone: json['phone']?.toString() ?? '',
    picture: Picture.fromJson(_objectAt(json, 'picture')),
  );
}

class Name {
  final String first;
  final String last;

  const Name({required this.first, required this.last});

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    first: json['first']?.toString() ?? '',
    last: json['last']?.toString() ?? '',
  );
}

class Location {
  final String city;
  final String country;

  const Location({required this.city, required this.country});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    city: json['city']?.toString() ?? '',
    country: json['country']?.toString() ?? '',
  );
}

class Login {
  final String uuid;
  final String username;
  final String password;

  const Login({
    required this.uuid,
    required this.username,
    required this.password,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    uuid: json['uuid']?.toString() ?? '',
    username: json['username']?.toString() ?? '',
    password: json['password']?.toString() ?? '',
  );
}

class Picture {
  final String large;

  const Picture({required this.large});

  factory Picture.fromJson(Map<String, dynamic> json) =>
      Picture(large: json['large']?.toString() ?? '');
}

Map<String, dynamic> _objectAt(Map<String, dynamic> json, String key) {
  final value = json[key];
  return value is Map<String, dynamic> ? value : const <String, dynamic>{};
}
