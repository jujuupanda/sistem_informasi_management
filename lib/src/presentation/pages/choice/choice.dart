import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sistem_informasi_sekolah/src/utils/assets.dart';

import '../../../routes/name_routes.dart';
import '../../widgets/choice/choice_widget.dart';

class ChoicePage extends StatefulWidget {
  const ChoicePage({super.key});

  @override
  State<ChoicePage> createState() => _ChoicePageState();
}

class _ChoicePageState extends State<ChoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.blueAccent,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height / 3,
              ),
              child: Center(
                child: Image.asset(
                  imageNoConn,
                  scale: 1,
                  width: 150,
                  height: 150,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Gap(24),
                    const Text(
                      "Selamat Datang",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    const Gap(40),
                    ButtonChoice(
                        onTap: () {
                          context.pushNamed(Routes.login);
                        },
                        buttonName: "Masuk"),
                    const Gap(10),
                    ButtonChoice(
                      onTap: () {},
                      buttonName: "Daftar",
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
