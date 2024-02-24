part of 'general_widget.dart';
class HeaderPage extends StatelessWidget {
  final String name;

  const HeaderPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  context.pop();
                },
                child: const Padding(
                  padding: EdgeInsets.all(4),
                  child: Icon(Icons.arrow_back_ios_rounded),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    name,
                    style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(4),
                child: Icon(
                  Icons.settings_rounded,
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 10,
          thickness: 1,
          color: Colors.grey,
        ),
      ],
    );
  }
}
