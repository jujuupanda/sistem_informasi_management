import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPageStudent extends StatefulWidget {
  const MainPageStudent({
    super.key,
  });

  @override
  State<MainPageStudent> createState() => _MainPageStudentState();
}

class _MainPageStudentState extends State<MainPageStudent> {
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Gap(30),
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
                child: const Column(
                  children: [
                    Text("Jadwal Hari Ini"),
                    Divider(
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                    Text("data1"),
                    Text("data1"),
                    Text("data1"),
                    Text("data1"),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
