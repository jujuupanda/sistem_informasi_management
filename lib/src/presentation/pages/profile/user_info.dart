import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../data/bloc/user/user_bloc.dart';
import '../../../utils/utils.dart';
import '../../widgets/general/general_widget.dart';
import '../../widgets/profile/profile_widget.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

///TODO: change Text to Text Form Field
class _UserInfoPageState extends State<UserInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderPage(name: "Profil"),
          const Gap(30),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserGetUserSuccessState) {
                    final userData = state.userData;
                    return Column(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Image.asset(
                              imageWarnConn,
                              scale: 1,
                            ),
                          ),
                        ),
                        const Gap(30),
                        UserInfoProfile(
                          onTap: () {},
                          name: userData.name != null
                              ? userData.name!
                              : "Nomor Pengguna",
                          icon: Icons.person_rounded,
                        ),
                        UserInfoProfile(
                          onTap: () {},
                          name: userData.identityNumber != null
                              ? userData.identityNumber!
                              : "Tidak Ada Nomor Identitas",
                          icon: Icons.credit_card_rounded,
                        ),
                        UserInfoProfile(
                          onTap: () {},
                          name: userData.majorclassId != null
                              ? userData.majorclass!.name!
                              : "Tidak Ada Jurusan/Kelas",
                          icon: Icons.class_rounded,
                        ),
                        UserInfoProfile(
                          onTap: () {},
                          name: userData.email != null
                              ? userData.email!
                              : "Tidak Ada Email",
                          icon: Icons.email_rounded,
                        ),
                        UserInfoProfile(
                            onTap: () {},
                            name: userData.address != null
                                ? userData.address!
                                : "Tidak Ada Alamat",
                            icon: Icons.location_on_rounded)
                      ],
                    );
                  } else {
                    return const Center(child: LoadingWidget());
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
