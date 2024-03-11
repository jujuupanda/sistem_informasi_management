import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/bloc/user/user_bloc.dart';
import '../../widgets/general/general_widget.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final _element = [
    {
      "day": "Senin",
      "subject": "Sistem Operasi",
      "startAt": "13:00",
      "endAt": "15:00"
    },
    {
      "day": "Senin",
      "subject": "Pemrograman",
      "startAt": "10:00",
      "endAt": "12:00"
    },
    {
      "day": "Selasa",
      "subject": "Logika",
      "startAt": "10:00",
      "endAt": "15:00"
    },
    {
      "day": "Rabu",
      "subject": "Basis Data",
      "startAt": "08:00",
      "endAt": "12:00"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderPage(name: "Jadwal Pelajaran"),
          Expanded(
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
                  BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _element.length,
                          itemBuilder: (context, index) {
                            ///add checker where day is today
                            return Padding(
                              padding: const EdgeInsets.all(4),
                              child: ScheduleInfo(
                                nameSubject: _element[index]["subject"],
                                startAt: _element[index]["startAt"],
                                endAt: _element[index]["endAt"],
                              ),
                            );
                          },
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ScheduleWeekly(
                      nameDay: "Senin",
                      length: 2,
                      nameSubject: "Sistem Operasi",
                      startAt: "13:00",
                      endAt: "15:00",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ScheduleWeekly(
                      nameDay: "Selasa",
                      length: 2,
                      nameSubject: "Sistem Operasi",
                      startAt: "13:00",
                      endAt: "15:00",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ScheduleWeekly(
                      nameDay: "Rabu",
                      length: 2,
                      nameSubject: "Sistem Operasi",
                      startAt: "13:00",
                      endAt: "15:00",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ScheduleWeekly(
                      nameDay: "Kamis",
                      length: 2,
                      nameSubject: "Sistem Operasi",
                      startAt: "13:00",
                      endAt: "15:00",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ScheduleWeekly(
                      nameDay: "Jumat",
                      length: 2,
                      nameSubject: "Sistem Operasi",
                      startAt: "13:00",
                      endAt: "15:00",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ScheduleWeekly(
                      nameDay: "Sabtu",
                      length: 2,
                      nameSubject: "Sistem Operasi",
                      startAt: "13:00",
                      endAt: "15:00",
                    ),
                  ),
                ],
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
    required this.length,
    required this.nameSubject,
    this.startAt,
    this.endAt,
  });

  final String? nameDay;
  final int? length;
  final String? nameSubject;
  final String? startAt;
  final String? endAt;

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
        ListView.builder(
          itemCount: length!,
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4),
              child: ScheduleInfo(
                  nameSubject: nameSubject!, startAt: startAt, endAt: endAt),
            );
          },
        )
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
