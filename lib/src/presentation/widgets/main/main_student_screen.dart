import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/parse_day.dart';

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

  @override
  void initState() {
    super.initState();

    dateNow = DateTime.now();
    dateString = currentTime(dateNow);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Murid",
                style: GoogleFonts.openSans(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const Gap(15),
                  Text(
                    dateString,
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  const Gap(20),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        color: Colors.grey,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Julio Adi Putra",
                              style: GoogleFonts.openSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "1915061008",
                              style: GoogleFonts.openSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Teknik Informatika",
                              style: GoogleFonts.openSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(15),
                      Container(
                        height: 50,
                        width: 50,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  const Gap(25),
                  Container(
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
                  ),
                  const Gap(25),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: Column(
                      children: [
                        const Text("Pengumuman Terkini"),
                        const Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                        const Gap(5),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            "Tidak ada pengumuman",
                            style: GoogleFonts.openSans(),
                          ),
                        ),
                        const Gap(5),
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Sistem Operasi merupakan lorem ipsum dolor amet",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    physics: const NeverScrollableScrollPhysics(),
                    // to disable GridView's scrolling
                    shrinkWrap: true,
                    // You won't see infinite size error
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.teal[100],
                        child: const Text("He'd hawve you all unravel at the"),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.teal[200],
                        child: const Text('Heed not the rabble'),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.teal[300],
                        child: const Text('Sound of screams but the'),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.teal[400],
                        child: const Text('Who scream'),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.teal[500],
                        child: const Text('Revolution is coming...'),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.teal[600],
                        child: const Text('Revolution, they...'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
