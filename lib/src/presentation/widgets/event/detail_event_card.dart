part of 'event_widget.dart';

class DetailEventCard extends StatelessWidget {
  const DetailEventCard({
    super.key,
    required this.widget,
  });

  final DetailEventPage widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(8),
        Text(
          widget.eventModel.eventName!,
          style: GoogleFonts.openSans(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(4),
        Text(
          "Dibuat oleh ${widget.eventModel.author!} - ${widget.eventModel.date!}",
          style: GoogleFonts.openSans(
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Divider(
          height: 8,
          thickness: 1,
          color: Colors.grey,
        ),
        const Gap(10),
        Text(
          widget.eventModel.eventData!,
          style: GoogleFonts.openSans(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
