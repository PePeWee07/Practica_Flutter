import 'package:flutter/material.dart';
import 'package:random_user/domain/entities/user.dart';
import 'package:random_user/infrastructure/services/user_service.dart';

class UsersProvider extends ChangeNotifier {
  List<User> users = [];
  bool isLoading = false;
  String? errorMessage;

  final UserService _userService = UserService();

  UsersProvider() {
    loadUser();
  }

  Future<void> loadUser() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      users = await _userService.getRandomUsers(25);
    } catch (e) {
      errorMessage = 'Algo salio mal: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
