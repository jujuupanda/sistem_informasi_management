import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sistem_informasi_sekolah/src/presentation/widgets/main/logout_button.dart';

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
