import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistem_informasi_sekolah/src/routes/name_routes.dart';

class LogoutButton extends StatefulWidget {
  const LogoutButton({
    super.key,
  });

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear().whenComplete(() {
      context.goNamed(Routes().login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: logout,
      child: const Text("Logout"),
    );
  }
}
