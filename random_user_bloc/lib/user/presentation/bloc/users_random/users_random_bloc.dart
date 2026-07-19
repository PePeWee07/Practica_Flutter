import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'users_random_event.dart';
part 'users_random_state.dart';

class UsersRandomBloc extends Bloc<UsersRandomEvent, UsersRandomState> {
  UsersRandomBloc() : super(UsersRandomInitial()) {
    on<UsersRandomEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
