import 'package:flutter/material.dart';

import 'app.dart';
import 'src/data/bloc/auth/auth_bloc.dart';
import 'src/data/bloc/event/event_bloc.dart';
import 'src/data/bloc/schedule/schedule_bloc.dart';
import 'src/data/bloc/user/user_bloc.dart';
import 'src/data/repositories/repository.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
        BlocProvider(
          create: (context) => ScheduleBloc(repository: Repository()),
        ),
      ],
      child: const App(),
    );
  }
}
