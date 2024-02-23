part of 'login_widget.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageNoConn,
      scale: 1,
      width: 120,
      height: 120,
    );
  }
}
