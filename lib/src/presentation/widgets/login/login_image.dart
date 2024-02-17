import 'package:flutter/material.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(90)),
      child: const Center(child: Text("image.png")),
    );
  }
}
