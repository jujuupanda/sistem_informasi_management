import 'package:flutter/material.dart';

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
      ],
    );
  }
}
