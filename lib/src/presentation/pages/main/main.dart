import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistem_informasi_sekolah/src/presentation/widgets/general/general_widget.dart';

import '../../../data/bloc/user/user_bloc.dart';
import '../../widgets/main/main_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String? role;
  late UserBloc _userBloc;

  Future<void> _getUserRole() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userRole = prefs.getString("role");
    setState(() {
      role = userRole;
    });
  }

  _getUser() {
    _userBloc = context.read<UserBloc>();
    _userBloc.add(UserGetUserEvent());
  }

  @override
  void initState() {
    _getUserRole();
    _getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserGetUserSuccessState) {
            return role == "1"
                ? const MainPageTeacher()
                : const MainPageStudent();
          } else {
            return const Center(
              child: LoadingWidget(),
            );
          }
        },
      ),
    );
  }
}
