import 'package:flutter/material.dart';
import 'package:flutter_provider_api_post/services/user_services.dart';

class UserProvider extends ChangeNotifier {
  List userList = [];

  getAllUser() async {
    userList = await UserService().getUser();
    notifyListeners();
  }

  addUser(String title, int userId) {
    UserService().postUser(title, userId);
    notifyListeners();
  }
}
