import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../data/bloc/auth/auth_bloc.dart';
import '../../../routes/name_routes.dart';
import '../../widgets/general/general_widget.dart';
import '../../widgets/login/login_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _usernameCtrl;
  late TextEditingController _passwordCtrl;
  late AuthBloc _authBloc;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  loginButton() {
    _authBloc = context.read<AuthBloc>();
    _authBloc.add(
      AuthLoginEvent(
        _usernameCtrl.text.toString(),
        _passwordCtrl.text.toString(),
      ),
    );
  }

  _initialAuth() {
    _authBloc = context.read<AuthBloc>();
    _authBloc.add(AuthInitialEvent());
  }

  @override
  void initState() {
    _usernameCtrl = TextEditingController();
    _passwordCtrl = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _initialAuth();
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoginSuccessState) {
          context.goNamed(Routes.main);
          _initialAuth();
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                const HeaderPage(name: "Login"),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      _initialAuth();
                    },
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Gap(40),
                              const LoginImage(),
                              const Gap(60),
                              TextFormField(
                                controller: _usernameCtrl,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: "Username",
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Username tidak boleh kosong!';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const Gap(20),
                              TextFormField(
                                controller: _passwordCtrl,
                                obscureText: true,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: "Kata Sandi",
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password tidak boleh kosong!';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const Align(
                                alignment: Alignment.centerRight,
                                child: ForgetPasswordButton(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: BlocBuilder<AuthBloc, AuthState>(
                                  builder: (context, state) {
                                    if (state is AuthLoginErrorState) {
                                      return Text(
                                        state.error,
                                        style: const TextStyle(
                                            color: Colors.redAccent),
                                      );
                                    } else {
                                      return const Padding(
                                        padding: EdgeInsets.all(7),
                                        child: SizedBox(),
                                      );
                                    }
                                  },
                                ),
                              ),
                              ButtonLogin(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    loginButton();
                                  }
                                },
                              ),
                              const Gap(15),
                              const DividerLogin(),
                              const Gap(15),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
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
                  ),
                ),
              ],
            ),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const Center(
                    child: LoadingWidget(),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
