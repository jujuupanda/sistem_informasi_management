import 'package:flutter/material.dart';

import 'app.dart';
import 'src/data/bloc/auth/auth_bloc.dart';
import 'src/data/bloc/event/event_bloc.dart';
import 'src/data/bloc/user/user_bloc.dart';
import 'src/data/repositories/repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(repository: Repository()),
        ),
        BlocProvider(
          create: (context) => EventBloc(repository: Repository()),
        ),
        BlocProvider(
          create: (context) => UserBloc(repository: Repository()),
        ),
      ],
      child: const App(),
    );
  }
}
