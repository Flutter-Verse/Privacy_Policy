import 'package:flutter/material.dart';
import 'package:test_build/change_notifier/models/user_notifier.dart';

class EditProfileScreen extends StatelessWidget {
  final UserNotifier userNotifier;

  const EditProfileScreen({required this.userNotifier});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            userNotifier.updateName("John");
          },
          child: Text("Change Name"),
        ),
      ),
    );
  }
}
