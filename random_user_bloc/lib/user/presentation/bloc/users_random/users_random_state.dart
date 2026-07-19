part of 'users_random_bloc.dart';

sealed class UsersRandomState extends Equatable {
  const UsersRandomState();
  
  @override
  List<Object> get props => [];
}

final class UsersRandomInitial extends UsersRandomState {}
