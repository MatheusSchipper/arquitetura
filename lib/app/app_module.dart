import 'package:arquitetura/app/app_controller.dart';
import 'package:arquitetura/app/app_widget.dart';
import 'package:arquitetura/app/interfaces/client_http_interface.dart';
import 'package:arquitetura/app/interfaces/local_storage_interface.dart';
import 'package:arquitetura/app/pages/home/home_controller.dart';
import 'package:arquitetura/app/repositories/apiadvisor_repository.dart';
import 'package:arquitetura/app/repositories/apiadvisor_repository_interface.dart';
import 'package:arquitetura/app/services/client_http_service.dart';
import 'package:arquitetura/app/services/shared_local_storage_service.dart';
import 'package:arquitetura/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:arquitetura/app/viewmodels/change_theme_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
    Bind((i)=> HomeController(i.get())),
    Bind((i) => ApiadvisorViewModel(i.get())),
    Bind<IApiAdvisor>((i) => ApiAdvisorRepository(i.get())),
    Bind<IClientHttp>((i) => ClientHttpService()),
    Bind((i) => AppController(i.get()), lazy: false),
    Bind((i) => ChangeThemeViewModel(localStorage: i.get())),
    Bind<ILocalStorage>((i) => SharedLocalStorageService()),
  ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => null;
  
}