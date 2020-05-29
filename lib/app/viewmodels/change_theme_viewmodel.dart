import 'package:arquitetura/app/interfaces/local_storage_interface.dart';
import 'package:arquitetura/app/models/appconfig_model.dart';

class ChangeThemeViewModel {
  final ILocalStorage localStorage;

  ChangeThemeViewModel({this.localStorage});

  Future init()async {
    await localStorage.get("isDark").then((value) => 
    {
      if(value != null) 
        config.themeSwitch.value = value
    });
  }

  final AppConfigModel config = AppConfigModel();

  changeTheme(bool value) {
    config.themeSwitch.value = value;
    localStorage.put("isDark", value);
  }
}
