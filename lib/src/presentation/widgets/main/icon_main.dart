part of 'main_widget.dart';

class IconMain extends StatelessWidget {
  final String icon;
  const IconMain({
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      child: Image.asset(icon),
    );
  }
}
