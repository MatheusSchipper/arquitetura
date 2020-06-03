import 'package:arquitetura/app/services/shared_local_storage_service.dart';
import 'package:arquitetura/app/viewmodels/change_theme_viewmodel.dart';
import 'package:flutter/foundation.dart';

class AppController {
  // //Singleton
  // static final AppController instance = AppController._();

  // //Construtor privado
  // AppController._()
  // {
  //   changeThemeViewModel.init();
  // }

  // final ChangeThemeViewModel changeThemeViewModel = ChangeThemeViewModel(localStorage: SharedLocalStorageService());

  final ChangeThemeViewModel changeThemeViewModel;

  AppController(this.changeThemeViewModel) {
    changeThemeViewModel.init();
  }
  
  bool get isDark => changeThemeViewModel.config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => changeThemeViewModel.config.themeSwitch;
}