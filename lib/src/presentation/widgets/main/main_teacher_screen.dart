import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'main_widget.dart';

class MainPageTeacher extends StatelessWidget {
  const MainPageTeacher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text("Guru"),
        ),
        Gap(70),
        LogoutButton()
      ],
    );
  }
}
