part of 'general_widget.dart';
class LogoutButton extends StatefulWidget {
  const LogoutButton({
    super.key,
  });

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear().whenComplete(() {
      context.goNamed(Routes.choice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: logout,
      child: const Text("Logout"),
    );
  }
}
