import 'package:flutter/material.dart';
import 'package:sistem_informasi_sekolah/src/presentation/pages/login/login.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: const LoginPage());
  }
}
