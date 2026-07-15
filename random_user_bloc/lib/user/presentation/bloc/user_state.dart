part of 'user_bloc.dart';

enum UserStatus { inital, loading, loaded, error }

class UserState extends Equatable {
  final UserStatus status;
  final MyUser? user;
  final String? errorMessage;

  const UserState({
    this.status = UserStatus.inital,
    this.user,
    this.errorMessage,
  });

  UserState copyWith({
    UserStatus? status,
    MyUser? user,
    String? errorMessage,
  }) => UserState(
    status: status ?? this.status,
    user: user ?? this.user,
    errorMessage: errorMessage ?? this.errorMessage,
  );

  @override
  List<Object?> get props => [status, user, errorMessage];
}
