import 'dart:developer' as developer;

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/app_strings.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/get_random_user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetRandomUser _getRandomUser;

  UserBloc(this._getRandomUser) : super(const UserInitial()) {
    on<UserRequested>(_onUserRequested, transformer: droppable());
  }

  Future<void> _onUserRequested(UserRequested event, Emitter<UserState> emit) async {
    emit(const UserLoading());

    try {
      final user = await _getRandomUser();
      emit(UserLoaded(user));
    } catch (exception, stackTrace) {
      developer.log(
        UserStrings.loadFailed,
        name: UserStrings.logName,
        error: exception,
        stackTrace: stackTrace,
      );
      emit(const UserError(UserStrings.loadFailed));
    }
  }
}
