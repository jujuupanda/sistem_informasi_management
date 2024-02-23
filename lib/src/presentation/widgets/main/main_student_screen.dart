part of 'main_widget.dart';

class MainPageStudent extends StatefulWidget {
  const MainPageStudent({
    super.key,
  });

  @override
  State<MainPageStudent> createState() => _MainPageStudentState();
}

class _MainPageStudentState extends State<MainPageStudent> {
  late String dateString;
  late DateTime dateNow;
  late EventBloc _eventBloc;

  _getEventForUser() {
    _eventBloc = context.read<EventBloc>();
    _eventBloc.add(EventGetEventForUserEvent());
  }

  @override
  void initState() {
    _getEventForUser();
    dateNow = DateTime.now();
    dateString = currentTime(dateNow);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderMain(
          name: "Murid",
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              return await Future.delayed(const Duration(seconds: 1), () {
                _getEventForUser();
              });
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const Gap(15),
                    DateTimeMain(dateString: dateString),
                    const Gap(20),
                    const Row(
                      children: [
                        IconMain(icon: imageNoConn),
                        Expanded(
                          child: UserInfoMain(
                            name: "Julio Adi Putra",
                            noId: "1915061008",
                            className: "Teknik Informatika",
                          ),
                        ),
                        Gap(15),
                        IconMain(icon: imageNoConn),
                      ],
                    ),
                    const Gap(25),
                    const ScheduleToday(),
                    const Gap(25),
                    const LatestNews(),
                    GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 30,
                      padding: const EdgeInsets.symmetric(
                          vertical: 32, horizontal: 12),
                      physics: const NeverScrollableScrollPhysics(),
                      // to disable GridView's scrolling
                      shrinkWrap: true,
                      // You won't see infinite size error
                      children: [
                        MainMenuList(
                          onTap: () {},
                          name: "Pengumuman",
                        ),
                        MainMenuList(
                          onTap: () {},
                          name: "Kelas",
                        ),
                        MainMenuList(
                          onTap: () {},
                          name: "Jadwal",
                        ),
                        MainMenuList(
                          onTap: () {},
                          name: "Tugas",
                        ),
                        MainMenuList(
                          onTap: () {},
                          name: "Pengaturan",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
