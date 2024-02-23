part of 'login_widget.dart';

class DividerLogin extends StatelessWidget {
  const DividerLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
    );
  }
}
