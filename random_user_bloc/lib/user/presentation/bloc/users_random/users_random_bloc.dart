import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:random_user_bloc/user/domain/entities/my_user.dart';
import 'package:random_user_bloc/user/domain/repositories/user_repository.dart';

part 'users_random_event.dart';
part 'users_random_state.dart';

class UsersRandomBloc extends Bloc<UsersRandomEvent, UsersRandomState> {
  final UserRepository userRepository;

  UsersRandomBloc({required this.userRepository})
    : super(UsersRandomInitial()) {
    on<UsersRandomRequest>(_onLoadRadomUsers);
  }

  Future<void> _onLoadRadomUsers(
    UsersRandomRequest event,
    Emitter<UsersRandomState> emit,
  ) async {
    // Primer Estado
    emit(const UsersRandomLoading());

    // Estado 'UsersRandomLoaded'(cargado) o Estado 'UsersRandomError' (Error)
    try {
      final users = await userRepository.getUsersRandom(10);
      emit(UsersRandomLoaded(users));
    } catch (e) {
      emit(UsersRandomError("Error: $e"));
    }
  }
}
