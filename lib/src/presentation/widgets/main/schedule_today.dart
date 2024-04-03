part of 'main_widget.dart';

class ScheduleToday extends StatefulWidget {
  const ScheduleToday({
    super.key,
  });

  @override
  State<ScheduleToday> createState() => _ScheduleTodayState();
}

class _ScheduleTodayState extends State<ScheduleToday> {
  late String dateString;
  late DateTime dateNow;

  @override
  void initState() {
    dateNow = DateTime.now();
    dateString = onlyDay(dateNow);
    super.initState();
  }

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
          BlocBuilder<ScheduleBloc, ScheduleState>(
            builder: (context, state) {
              if (state is GetScheduleSuccessState) {
                final listSchedule = state.listSchedule;
                final listScheduleToday = listSchedule
                    .where((element) => element.day == dateString)
                    .toList();

                if (listSchedule.isNotEmpty) {
                  return Container(
                    constraints: const BoxConstraints(
                      maxHeight: 100,
                      minHeight: 50,
                    ),

                    ///Check day is today
                    child: ListView.builder(
                      shrinkWrap: false,
                      padding: EdgeInsets.zero,
                      itemCount: listScheduleToday.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(listScheduleToday[index].subject!.name!),
                              Text(
                                  "${listScheduleToday[index].startAt} - ${listScheduleToday[index].endAt}"),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "Tidak ada jadwal hari ini",
                      style: GoogleFonts.openSans(),
                    ),
                  );
                }
              }
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "Jadwal Kosong",
                  style: GoogleFonts.openSans(),
                ),
              );
            },
          ),
          const Gap(5),
        ],
      ),
    );
  }
}
