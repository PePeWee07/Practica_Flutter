import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:random_user_bloc/user/domain/entities/my_user.dart';
import 'package:random_user_bloc/user/domain/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserState()) {
    on<LoadRandomUser>(_onLoadRandomUser);
  }

  Future<void> _onLoadRandomUser(
    LoadRandomUser event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: UserStatus.loading));

    try {
      final user = await userRepository.getUserRandom();
      emit(state.copyWith(status: UserStatus.loaded, user: user));
    } catch (e) {
      emit(state.copyWith(status: UserStatus.error, errorMessage: '$e'));
    }
  }
}
