import 'package:flutter/material.dart';

import 'src/routes/name_routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int colorScheme = 0;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp.router(
        routerConfig: router,
        theme: colorScheme == 0 ? ThemeData.light() : ThemeData.dark(),
      ),
    );
  }
}
