part of 'main_widget.dart';

class MainMenuList extends StatelessWidget {
  final VoidCallback onTap;
  final String name;

  const MainMenuList({
    required this.onTap,
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                imageNoConn,
                height: 50,
                width: 50,
              ),
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
