import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
              child: Column(
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
                    name: "Julio Adi Putra",
                    icon: Icons.person_rounded,
                  ),
                  UserInfoProfile(
                    onTap: () {},
                    name: "1915061008",
                    icon: Icons.credit_card_rounded,
                  ),
                  UserInfoProfile(
                    onTap: () {},
                    name: "Teknik Informatika",
                    icon: Icons.class_rounded,
                  ),
                  UserInfoProfile(
                    onTap: () {},
                    name: "imkenarok@gmail.com",
                    icon: Icons.email_rounded,
                  ),
                  UserInfoProfile(
                      onTap: () {},
                      name: "Tanjung Bintang",
                      icon: Icons.location_on_rounded)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
