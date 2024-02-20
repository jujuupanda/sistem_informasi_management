part of 'main_widget.dart';


class ScheduleToday extends StatelessWidget {
  const ScheduleToday({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Column(
        children: [
          const Text("Jadwal Hari Ini"),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          const Gap(5),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              "Tidak ada jadwal hari ini",
              style: GoogleFonts.openSans(),
            ),
          ),
          const Gap(5),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sistem Operasi"),
                Text("13:00"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
