import 'package:arquitetura/app/models/appconfig_model.dart';
import 'package:flutter/foundation.dart';

class AppController {
  //Singleton
  static final AppController instance = AppController._();

  //Construtor privado
  AppController._();

  final AppConfigModel config = AppConfigModel();
  bool get isDark => config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => config.themeSwitch;

  //Futuramente, será inserido em outra camada
  changeTheme(bool value){
    config.themeSwitch.value = value;
  }

}