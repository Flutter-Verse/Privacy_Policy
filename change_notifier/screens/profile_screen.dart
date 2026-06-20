import 'package:flutter/material.dart';
import 'package:test_build/change_notifier/models/user_notifier.dart';
import 'package:test_build/change_notifier/screens/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  final UserNotifier userNotifier;

  const ProfileScreen({required this.userNotifier});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: userNotifier,
      builder: (_, __) {
        return Scaffold(
          body: Column(
            children: [
              Text(userNotifier.name),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          EditProfileScreen(userNotifier: userNotifier),
                    ),
                  );
                },
                child: Text("Edit"),
              ),
            ],
          ),
        );
      },
    );
  }
}
