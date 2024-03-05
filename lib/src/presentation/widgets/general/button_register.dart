part of 'general_widget.dart';

class ButtonRegister extends StatelessWidget {
  final VoidCallback? onTap;

  const ButtonRegister({
    required this.onTap,
    super.key,
  });

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
          onTap: onTap,
          borderRadius: BorderRadius.circular(15),
          splashColor: Colors.blue,
          child: const Center(
              child: Text(
            "Daftar",
            style: TextStyle(
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
