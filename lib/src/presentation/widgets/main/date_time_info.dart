part of 'main_widget.dart';

class DateTimeMain extends StatelessWidget {
  const DateTimeMain({
    super.key,
    required this.dateString,
  });

  final String dateString;

  @override
  Widget build(BuildContext context) {
    return Text(
      dateString,
      style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 18),
    );
  }
}
