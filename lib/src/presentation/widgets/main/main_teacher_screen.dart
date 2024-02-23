part of 'main_widget.dart';

class MainPageTeacher extends StatelessWidget {
  const MainPageTeacher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("Guru"),
        ),
        Gap(70),
        LogoutButton()
      ],
    );
  }
}
