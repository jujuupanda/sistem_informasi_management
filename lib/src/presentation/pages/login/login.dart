import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../widgets/login/login_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailCtrl;
  late TextEditingController _passwordCtrl;

  @override
  void initState() {
    _emailCtrl = TextEditingController();
    _passwordCtrl = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(40),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: LoginTitle(),
                ),
                const Gap(20),
                const LoginImage(),
                const Gap(20),
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
                const ButtonLogin(),
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
