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
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserGetUserSuccessState) {
                if (state.userData.majorclassId != null) {
                  final userLessons = state.userData.majorclass!.lessons!;
                  return Container(
                    constraints: const BoxConstraints(
                      maxHeight: 100,
                      minHeight: 50,
                    ),
                    ///Check day is today
                    child: ListView.builder(
                      shrinkWrap: false,
                      padding: EdgeInsets.zero,
                      itemCount: userLessons.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(userLessons[index].name!),
                              Text(userLessons[index].startAt!),
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
                  "Tidak ada jadwal hari ini",
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
