import 'package:flutter/foundation.dart';

class AppController {
  //Singleton
  static final AppController instance = AppController._();

  //Construtor privado
  AppController._();

  final themeSwitch = ValueNotifier<bool>(false);

  changeTheme(bool value){
    themeSwitch.value = value;
  }

}