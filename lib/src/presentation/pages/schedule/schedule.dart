import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/bloc/schedule/schedule_bloc.dart';
import '../../../data/bloc/user/user_bloc.dart';
import '../../../utils/parse_day.dart';
import '../../widgets/general/general_widget.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late String dateString;
  late DateTime dateNow;
  late UserBloc _userBloc;

  _getUser() {
    _userBloc = context.read<UserBloc>();
    _userBloc.add(UserGetUserEvent());
  }

  @override
  void initState() {
    dateNow = DateTime.now();
    dateString = onlyDay(dateNow);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderPage(name: "Jadwal Pelajaran"),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                return await Future.delayed(const Duration(seconds: 1), () {
                  _getUser();
                });
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Gap(24),
                    Text(
                      "Jadwal Hari Ini",
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    BlocBuilder<ScheduleBloc, ScheduleState>(
                      builder: (context, state) {
                        if (state is GetScheduleSuccessState) {
                          final listSchedule = state.listSchedule;
                          final listScheduleToday = listSchedule
                              .where((element) => element.day == dateString)
                              .toList();
                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: ListView.builder(
                              padding: const EdgeInsets.all(8),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: listScheduleToday.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: ScheduleInfo(
                                    nameSubject:
                                        listScheduleToday[index].subject!.name!,
                                    startAt: listScheduleToday[index].startAt,
                                    endAt: listScheduleToday[index].endAt,
                                  ),
                                );
                              },
                            ),
                          );
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
                    const Gap(26),
                    Text(
                      "Jadwal Minggu Ini",
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Gap(16),
                    BlocBuilder<ScheduleBloc, ScheduleState>(
                      builder: (context, state) {
                        if (state is GetScheduleSuccessState) {
                          final listSchedule = state.listSchedule;
                          final listScheduleSenin = listSchedule
                              .where((element) => element.day == "Senin")
                              .toList();
                          final listScheduleSelasa = listSchedule
                              .where((element) => element.day == "Selasa")
                              .toList();
                          final listScheduleRabu = listSchedule
                              .where((element) => element.day == "Rabu")
                              .toList();
                          final listScheduleKamis = listSchedule
                              .where((element) => element.day == "Kamis")
                              .toList();
                          final listScheduleJumat = listSchedule
                              .where((element) => element.day == "Jumat")
                              .toList();
                          final listScheduleSabtu = listSchedule
                              .where((element) => element.day == "Sabtu")
                              .toList();
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ScheduleWeekly(
                                  nameDay: "Senin",
                                  customWidget: listScheduleSenin.isNotEmpty
                                      ? ListView.builder(
                                          padding: const EdgeInsets.all(8),
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: listScheduleSenin.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(4),
                                              child: ScheduleInfo(
                                                nameSubject:
                                                    listScheduleSenin[index]
                                                        .subject!
                                                        .name!,
                                                startAt:
                                                    listScheduleSenin[index]
                                                        .startAt,
                                                endAt: listScheduleSenin[index]
                                                    .endAt,
                                              ),
                                            );
                                          },
                                        )
                                      : const ScheduleEmpty(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ScheduleWeekly(
                                  nameDay: "Selasa",
                                  customWidget: listScheduleSelasa.isNotEmpty
                                      ? ListView.builder(
                                          padding: const EdgeInsets.all(8),
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: listScheduleSelasa.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(4),
                                              child: ScheduleInfo(
                                                nameSubject:
                                                    listScheduleSelasa[index]
                                                        .subject!
                                                        .name!,
                                                startAt:
                                                    listScheduleSelasa[index]
                                                        .startAt,
                                                endAt: listScheduleSelasa[index]
                                                    .endAt,
                                              ),
                                            );
                                          },
                                        )
                                      : const ScheduleEmpty(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ScheduleWeekly(
                                  nameDay: "Rabu",
                                  customWidget: listScheduleRabu.isNotEmpty
                                      ? ListView.builder(
                                          padding: const EdgeInsets.all(8),
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: listScheduleRabu.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(4),
                                              child: ScheduleInfo(
                                                nameSubject:
                                                    listScheduleRabu[index]
                                                        .subject!
                                                        .name!,
                                                startAt: listScheduleRabu[index]
                                                    .startAt,
                                                endAt: listScheduleRabu[index]
                                                    .endAt,
                                              ),
                                            );
                                          },
                                        )
                                      : const ScheduleEmpty(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ScheduleWeekly(
                                  nameDay: "Kamis",
                                  customWidget: listScheduleKamis.isNotEmpty
                                      ? ListView.builder(
                                          padding: const EdgeInsets.all(8),
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: listScheduleKamis.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(4),
                                              child: ScheduleInfo(
                                                nameSubject:
                                                    listScheduleKamis[index]
                                                        .subject!
                                                        .name!,
                                                startAt:
                                                    listScheduleKamis[index]
                                                        .startAt,
                                                endAt: listScheduleKamis[index]
                                                    .endAt,
                                              ),
                                            );
                                          },
                                        )
                                      : const ScheduleEmpty(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ScheduleWeekly(
                                  nameDay: "Jumat",
                                  customWidget: listScheduleJumat.isNotEmpty
                                      ? ListView.builder(
                                          padding: const EdgeInsets.all(8),
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: listScheduleJumat.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(4),
                                              child: ScheduleInfo(
                                                nameSubject:
                                                    listScheduleJumat[index]
                                                        .subject!
                                                        .name!,
                                                startAt:
                                                    listScheduleJumat[index]
                                                        .startAt,
                                                endAt: listScheduleJumat[index]
                                                    .endAt,
                                              ),
                                            );
                                          },
                                        )
                                      : const ScheduleEmpty(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ScheduleWeekly(
                                  nameDay: "Sabtu",
                                  customWidget: listScheduleSabtu.isNotEmpty
                                      ? ListView.builder(
                                          padding: const EdgeInsets.all(8),
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: listScheduleSabtu.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(4),
                                              child: ScheduleInfo(
                                                nameSubject:
                                                    listScheduleSabtu[index]
                                                        .subject!
                                                        .name!,
                                                startAt:
                                                    listScheduleSabtu[index]
                                                        .startAt,
                                                endAt: listScheduleSabtu[index]
                                                    .endAt,
                                              ),
                                            );
                                          },
                                        )
                                      : const ScheduleEmpty(),
                                ),
                              ),
                            ],
                          );
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScheduleWeekly extends StatelessWidget {
  const ScheduleWeekly({
    super.key,
    required this.nameDay,
    required this.customWidget,
  });

  final String? nameDay;
  final Widget? customWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nameDay!,
          style: GoogleFonts.openSans(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.start,
        ),
        customWidget!
      ],
    );
  }
}

class ScheduleInfo extends StatelessWidget {
  const ScheduleInfo(
      {super.key, required this.nameSubject, this.startAt, this.endAt});

  final String? nameSubject;
  final String? startAt;
  final String? endAt;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(nameSubject!),
            Text("$startAt - $endAt"),
          ],
        ),
        const Divider(
          thickness: 1,
          color: Colors.black,
        ),
        const Gap(4)
      ],
    );
  }
}

class ScheduleEmpty extends StatelessWidget {
  const ScheduleEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Jadwal Kosong"),
              Text(""),
            ],
          ),
          Divider(
            thickness: 1,
            color: Colors.black,
          ),
          Gap(4)
        ],
      ),
    );
  }
}
