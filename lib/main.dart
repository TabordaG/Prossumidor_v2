import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prossumidor_v2/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(ModularApp(module: AppModule()));
}
