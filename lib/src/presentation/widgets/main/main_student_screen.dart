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
  late UserBloc _userBloc;

  _getEventForUser() {
    _eventBloc = context.read<EventBloc>();
    _eventBloc.add(EventGetEventForUserEvent());
  }

  _getUser() {
    _userBloc = context.read<UserBloc>();
    _userBloc.add(UserGetUserEvent());
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
                _getUser();
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
                    Row(
                      children: [
                        const IconMain(icon: imageNoConn),
                        Expanded(
                          child: BlocBuilder<UserBloc, UserState>(
                            builder: (context, state) {
                              if (state is UserGetUserSuccessState) {
                                final userData = state.userData;
                                return UserInfoMain(
                                  name: userData.name != null
                                      ? userData.name!
                                      : "",
                                  noId: userData.identityNumber != null
                                      ? userData.identityNumber!
                                      : "",
                                  className:  userData.majorclassId != null
                                      ? userData.majorclass!.name!
                                      : "",
                                );
                              }
                              return const UserInfoMain(
                                name: "Nama Pengguna",
                                noId: "No ID/Pengenal",
                                className: "Jurusan/Kelas",
                              );
                            },
                          ),
                        ),
                        const Gap(15),
                        const IconMain(icon: imageNoConn),
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
                          onTap: () {
                            context.pushNamed(Routes.event);
                          },
                          name: "Pengumuman",
                        ),
                        MainMenuList(
                          onTap: () {},
                          name: "Jadwal",
                        ),
                        MainMenuList(
                          onTap: () {},
                          name: "Tugas",
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
