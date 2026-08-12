part of 'users_random_bloc.dart';

sealed class UsersRandomState extends Equatable {
  const UsersRandomState();

  @override
  List<Object> get props => [];
}

final class UsersRandomInitial extends UsersRandomState {
  const UsersRandomInitial();
}

final class UsersRandomLoading extends UsersRandomState {
  const UsersRandomLoading();
}

final class UsersRandomLoaded extends UsersRandomState {
  final List<MyUser> usersRandom;
  const UsersRandomLoaded(this.usersRandom);

  @override
  List<Object> get props => [usersRandom];
}

final class UsersRandomError extends UsersRandomState {
  final String message;
  const UsersRandomError(this.message);

  @override
  List<Object> get props => [message];
}
