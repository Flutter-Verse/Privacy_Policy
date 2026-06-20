import 'package:flutter/material.dart';
import 'package:test_build/change_notifier/models/user_notifier.dart';
import 'package:test_build/change_notifier/screens/profile_screen.dart';

class DashboardScreen extends StatelessWidget {
  final UserNotifier userNotifier;

  const DashboardScreen({required this.userNotifier});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Profile"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProfileScreen(userNotifier: userNotifier),
              ),
            );
          },
        ),
      ),
    );
  }
}
