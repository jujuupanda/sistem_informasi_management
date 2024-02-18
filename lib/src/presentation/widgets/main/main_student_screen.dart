import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'logout_button.dart';

class MainPageStudent extends StatelessWidget {
  const MainPageStudent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text("Murid"),
        ),
        Gap(70),
        LogoutButton(),
      ],
    );
  }
}
