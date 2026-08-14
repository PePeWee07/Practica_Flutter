import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String gender;
  final String email;
  final String accountName;
  final String pass;
  final String mobilePhone;
  final String avatarUrl;
  final String city;
  final String country;

  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.email,
    required this.accountName,
    required this.pass,
    required this.mobilePhone,
    required this.avatarUrl,
    required this.city,
    required this.country,
  });

  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    gender,
    email,
    accountName,
    pass,
    mobilePhone,
    avatarUrl,
    city,
    country,
  ];
}
