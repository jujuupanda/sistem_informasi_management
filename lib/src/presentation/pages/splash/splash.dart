import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sistem_informasi_sekolah/src/data/bloc/auth/auth_bloc.dart';

import '../../../routes/name_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Timer _timer;
  late AuthBloc _authBloc;

  _userAuth() {
    _authBloc = context.read<AuthBloc>();
    _authBloc.add(AuthorizationEvent());
  }

  _splashTime() {
    _timer = Timer(const Duration(seconds: 2, milliseconds: 5), () async {
      _userAuth();
    });
  }

  @override
  void didChangeDependencies() {
    _splashTime();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is IsAuthorizedState) {
          context.goNamed(Routes.main);
        }
        if (state is UnAuthorizedState) {
          context.goNamed(Routes.choice);
        }
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
