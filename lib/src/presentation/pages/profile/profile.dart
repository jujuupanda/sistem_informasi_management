import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/utils.dart';
import '../../widgets/general/general_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  "Saya",
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
            child: RefreshIndicator(
              onRefresh: () async {
                return await Future.delayed(const Duration(seconds: 1), () {
                  print("object");
                });
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Gap(42),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: Image.asset(
                          imageNoConn,
                          scale: 1,
                        ),
                      ),
                      const Gap(20),
                      Text(
                        "Julio Adi Putra",
                        style: GoogleFonts.openSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(5),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      const Gap(10),
                      InkWell(
                        onTap: (){},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.person_rounded,
                                size: 40,
                                color: Colors.blueAccent,
                              ),
                              const Gap(20),
                              Expanded(
                                child: Text(
                                  "Profil",
                                  style: GoogleFonts.openSans(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 30,
                                color: Colors.blueAccent,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.password_rounded,
                                size: 40,
                                color: Colors.blueAccent,
                              ),
                              const Gap(20),
                              Expanded(
                                child: Text(
                                  "Kata Sandi",
                                  style: GoogleFonts.openSans(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 30,
                                color: Colors.blueAccent,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.settings_rounded,
                                size: 40,
                                color: Colors.blueAccent,
                              ),
                              const Gap(20),
                              Expanded(
                                child: Text(
                                  "Pengaturan",
                                  style: GoogleFonts.openSans(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 30,
                                color: Colors.blueAccent,
                              )
                            ],
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: (){},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.dark_mode_rounded,
                                size: 40,
                                color: Colors.blueAccent,
                              ),
                              const Gap(20),
                              Expanded(
                                child: Text(
                                  "Mode Gelap",
                                  style: GoogleFonts.openSans(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 30,
                                color: Colors.blueAccent,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.notifications_active_rounded,
                                size: 40,
                                color: Colors.blueAccent,
                              ),
                              const Gap(20),
                              Expanded(
                                child: Text(
                                  "Notifikasi",
                                  style: GoogleFonts.openSans(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 30,
                                color: Colors.blueAccent,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.help_rounded,
                                size: 40,
                                color: Colors.blueAccent,
                              ),
                              const Gap(20),
                              Expanded(
                                child: Text(
                                  "Bantuan",
                                  style: GoogleFonts.openSans(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 30,
                                color: Colors.blueAccent,
                              )
                            ],
                          ),
                        ),
                      ),

                      const Gap(20),
                      const LogoutButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
