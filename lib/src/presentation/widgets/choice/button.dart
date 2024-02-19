import 'package:flutter/material.dart';

class ButtonChoice extends StatefulWidget {
  final VoidCallback? onTap;
  final String buttonName;

  const ButtonChoice({
    required this.onTap,
    required this.buttonName,
    super.key,
  });

  @override
  State<ButtonChoice> createState() => _ButtonChoiceState();
}

class _ButtonChoiceState extends State<ButtonChoice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(15),
          splashColor: Colors.blue,
          child: Center(
              child: Text(
            widget.buttonName,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          )),
        ),
      ),
    );
  }
}
