import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../data/bloc/auth/auth_bloc.dart';
import '../../../routes/name_routes.dart';
import '../../widgets/login/login_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailCtrl;
  late TextEditingController _passwordCtrl;
  late AuthBloc _authBloc;

  loginButton() {
    _authBloc = context.read<AuthBloc>();
    _authBloc.add(
      AuthLoginEvent(
        _emailCtrl.text.toString(),
        _passwordCtrl.text.toString(),
      ),
    );
  }

  @override
  void initState() {
    _emailCtrl = TextEditingController();
    _passwordCtrl = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoginSuccessState) {
          context.goNamed(Routes.main);
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {
                        context.pop();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(4),
                        child: Icon(Icons.arrow_back_ios_rounded),
                      ),
                    ),
                    const Gap(20),
                    const Expanded(child: LoginTitle())
                  ],
                ),
                const Gap(80),
                const LoginImage(),
                const Gap(40),
                TextFormField(
                  controller: _emailCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Email",
                  ),
                ),
                const Gap(20),
                TextFormField(
                  controller: _passwordCtrl,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Kata Sandi",
                  ),
                ),
                const Align(
                    alignment: Alignment.centerRight,
                    child: ForgetPasswordButton()),
                const Gap(20),
                ButtonLogin(onTap: loginButton),
                const Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        thickness: 1,
                        endIndent: 10,
                      ),
                    ),
                    Text("atau"),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        thickness: 1,
                        indent: 10,
                      ),
                    ),
                  ],
                ),
                const Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    ButtonOtherLogin(),
                    Gap(20),
                    ButtonOtherLogin(),
                    Gap(20),
                    ButtonOtherLogin(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
