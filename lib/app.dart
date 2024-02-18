import 'package:flutter/material.dart';
import 'package:sistem_informasi_sekolah/src/routes/routes_app.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp.router(
          routerConfig: RoutesApp().router,
        ));
  }
}
