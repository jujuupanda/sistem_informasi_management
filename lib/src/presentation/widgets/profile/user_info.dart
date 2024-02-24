part of 'profile_widget.dart';

class UserInfoProfile extends StatelessWidget {
  const UserInfoProfile({
    super.key,
    required this.onTap,
    required this.name,
    required this.icon
  });

  final VoidCallback onTap;
  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.blueAccent,
              size: 36,
            ),
            const Gap(16),
            Text(
              name,
              style: GoogleFonts.openSans(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
