import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sistem_informasi_sekolah/src/routes/name_routes.dart';

import '../../../data/bloc/user/user_bloc.dart';
import '../../widgets/general/general_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _usernameCtrl;
  late TextEditingController _passwordCtrl;
  late TextEditingController _nameCtrl;
  late SingleValueDropDownController _roleCtrl;
  late UserBloc _userBloc;

  _addUser() {
    _userBloc = context.read<UserBloc>();
    _userBloc.add(UserAddUserEvent(
      _usernameCtrl.text.toString(),
      _passwordCtrl.text.toString(),
      _nameCtrl.text.toString(),
      _roleCtrl.dropDownValue!.value.toString(),
    ));
  }

  _initialUser() {
    _userBloc = context.read<UserBloc>();
    _userBloc.add(UserInitialEvent());
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pendaftaran Berhasil'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Pendaftaran berhasil dilakukan.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Kembali'),
              onPressed: () {
                _initialUser();
                context.goNamed(Routes.choice);
              },
            ),
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                _initialUser();
                context.pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    _usernameCtrl = TextEditingController();
    _passwordCtrl = TextEditingController();
    _nameCtrl = TextEditingController();
    _roleCtrl = SingleValueDropDownController();

    super.initState();
  }

  @override
  void dispose() {
    _roleCtrl.dispose();

    super.dispose();
  }

  final List<DropDownValueModel> _roleDropDown = const [
    DropDownValueModel(name: 'Guru', value: "1"),
    DropDownValueModel(name: 'Murid', value: "2"),
  ];

  @override
  Widget build(BuildContext context) {
    _initialUser();
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserAddUserSuccessState) {
            WidgetsBinding.instance
                .addPostFrameCallback((_) => _showMyDialog());
          }
          return Stack(
            children: [
              Column(
                children: [
                  const HeaderPage(name: "Register"),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {},
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Gap(20),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Gabung Sekarang Juga!",
                                    style: GoogleFonts.openSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const Gap(40),
                                TextFormField(
                                  controller: _usernameCtrl,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: "Username",
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Username tidak boleh kosong!';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const Gap(20),
                                TextFormField(
                                  controller: _passwordCtrl,
                                  obscureText: true,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: "Kata Sandi",
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Password tidak boleh kosong!';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const Gap(20),
                                TextFormField(
                                  controller: _nameCtrl,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: "Nama",
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Username tidak boleh kosong!';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const Gap(20),
                                DropDownTextField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: _roleCtrl,
                                  textFieldDecoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: "Sebagai...",
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Role tidak boleh kosong!";
                                    } else {
                                      return null;
                                    }
                                  },
                                  dropDownList: _roleDropDown,
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                ),
                                const Gap(40),
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: BlocBuilder<UserBloc, UserState>(
                                    builder: (context, state) {
                                      if (state is UserAddUserErrorState) {
                                        return Text(
                                          state.error,
                                          style: const TextStyle(
                                              color: Colors.redAccent),
                                        );
                                      } else {
                                        return const Padding(
                                          padding: EdgeInsets.all(7),
                                          child: SizedBox(),
                                        );
                                      }
                                    },
                                  ),
                                ),
                                ButtonRegister(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      _addUser();
                                    }
                                  },
                                ),
                                const Gap(15),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserLoadingState) {
                    return const Center(
                      child: LoadingWidget(),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
