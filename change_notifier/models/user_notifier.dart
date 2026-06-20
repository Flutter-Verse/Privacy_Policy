import 'package:flutter/material.dart';

class UserNotifier extends ChangeNotifier {
  String name = "Manish";
  String email = "manish@gmail.com";

  void updateName(String newName) {
    name = newName;
    notifyListeners();
  }
}
