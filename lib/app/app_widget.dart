import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Recoopsol',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
