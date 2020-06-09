import 'package:arquitetura/app/app_controller.dart';
import 'package:arquitetura/app/app_widget.dart';
import 'package:arquitetura/app/core/interfaces/client_http_interface.dart';
import 'package:arquitetura/app/core/interfaces/local_storage_interface.dart';
import 'package:arquitetura/app/core/services/client_http_service.dart';
import 'package:arquitetura/app/core/services/shared_local_storage_service.dart';
import 'package:arquitetura/app/core/viewmodels/change_theme_viewmodel.dart';
import 'package:arquitetura/app/modules/home/home_module.dart';
import 'package:arquitetura/app/modules/login/login_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<IClientHttp>((i) => ClientHttpService()),
        Bind((i) => AppController(i.get()), lazy: false),
        Bind((i) => ChangeThemeViewModel(localStorage: i.get())),
        Bind<ILocalStorage>((i) => SharedLocalStorageService()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => [
        Router('/', module: LoginModule()),
        Router('/home', module: HomeModule()),
      ];
}
