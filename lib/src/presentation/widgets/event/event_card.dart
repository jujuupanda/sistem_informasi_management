part of 'event_widget.dart';

class EventCard extends StatelessWidget {
  final EventModel listEvents;

  const EventCard({
    super.key,
    required this.listEvents,
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              listEvents.eventName!,
              style: GoogleFonts.openSans(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Dibuat oleh ${listEvents.author} - ${listEvents.date}",
              style: GoogleFonts.openSans(
                fontSize: 12,
              ),
            ),
            const Gap(10),
            Text(
              listEvents.eventData!,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const Gap(10),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 30,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10)),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      context.pushNamed(
                        Routes.detailEvent,
                        extra: listEvents,
                      );
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Center(
                      child: Text(
                        "Baca Selengkapnya",
                        style: GoogleFonts.openSans(
                            fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
