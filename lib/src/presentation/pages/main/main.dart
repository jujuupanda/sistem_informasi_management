import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/main/main_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String? role;

  Future<void> _getUserRole() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userRole = prefs.getString("role");
    setState(() {
      role = userRole;
    });
  }

  @override
  void initState() {
    _getUserRole();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Page"),
      ),
      // body: const MainPageStudent(),
      body: role == "1" ? const MainPageTeacher() : const MainPageStudent(),
    );
  }
}
