import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sistem_informasi_sekolah/src/data/bloc/auth/auth_bloc.dart';

import '../../../routes/name_routes.dart';
import '../../../utils/utils.dart';
import '../../widgets/profile/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late AuthBloc _authBloc;

  _logout() async {
    _authBloc = context.read<AuthBloc>();
    _authBloc.add(AuthLogoutEvent());
  }

  _initialAuth() {
    _authBloc = context.read<AuthBloc>();
    _authBloc.add(
      AuthInitialEvent(),
    );
  }

  _popWhenExit() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const SizedBox(
            height: 130,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Icon(
                    Icons.logout,
                    size: 60,
                    color: Colors.blueAccent,
                  ),
                ),
                Gap(10),
                Text(
                  'Apakah kamu yakin ingin keluar?',
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: Colors.blueAccent,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Tidak',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _logout();
                    _initialAuth();
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueAccent),
                    child: const Center(
                      child: Text(
                        'Keluar',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLogoutSuccessState) {
          context.goNamed(Routes.login);
        }
      },
      child: Scaffold(
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
                        ProfileMenu(
                          name: "Profile",
                          onTap: () {},
                          icon: Icons.person_rounded,
                        ),
                        ProfileMenu(
                          name: "Kata Sandi",
                          onTap: () {},
                          icon: Icons.password_rounded,
                        ),
                        ProfileMenu(
                          name: "Pengaturan",
                          onTap: () {},
                          icon: Icons.settings_rounded,
                        ),
                        ProfileMenu(
                          name: "Notifikasi",
                          onTap: () {},
                          icon: Icons.notifications_on_rounded,
                        ),
                        ProfileMenu(
                          name: "Mode Gelap",
                          onTap: () {},
                          icon: Icons.dark_mode_rounded,
                        ),
                        ProfileMenu(
                          name: "Bantuan",
                          onTap: () {},
                          icon: Icons.help,
                        ),
                        const Gap(30),
                        ProfileMenu(
                          name: "Keluar",
                          onTap: _popWhenExit,
                          icon: Icons.logout_rounded,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}