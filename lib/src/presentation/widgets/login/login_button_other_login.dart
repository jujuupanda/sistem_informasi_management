part of 'login_widget.dart';

class ButtonOtherLogin extends StatelessWidget {
  const ButtonOtherLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(15),
          child: const Center(child: Text("F")),
        ),
      ),
    );
  }
}
