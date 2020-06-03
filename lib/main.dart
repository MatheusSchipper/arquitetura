import 'package:arquitetura/app/app_module.dart';
//import 'package:arquitetura/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  //runApp(AppWidget());
  runApp(ModularApp(
    module: AppModule(),
  ));
}
