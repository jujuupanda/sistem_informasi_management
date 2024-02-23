part of 'profile_widget.dart';

class ProfileMenu extends StatefulWidget {
  final String name;
  final VoidCallback onTap;
  final IconData icon;

  const ProfileMenu({
    super.key,
    required this.name,
    required this.onTap,
    required this.icon,
  });

  @override
  State<ProfileMenu> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {
  late bool isDark;

  @override
  void initState() {
    isDark = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              widget.icon,
              size: 40,
              color: Colors.blueAccent,
            ),
            const Gap(20),
            Expanded(
              child: Text(
                widget.name,
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            widget.name != "Mode Gelap"
                ? const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 30,
                    color: Colors.blueAccent,
                  )
                : Switch(
                    value: isDark,
                    onChanged: (value) {
                      setState(() {
                        isDark = !isDark;
                      });
                    },
                  )
          ],
        ),
      ),
    );
  }
}
