import 'package:arquitetura/app/core/interfaces/client_http_interface.dart';
import 'package:arquitetura/app/modules/home/home_controller.dart';
import 'package:arquitetura/app/modules/home/home_page.dart';
import 'package:arquitetura/app/modules/home/interfaces/apiadvisor_repository_interface.dart';
import 'package:arquitetura/app/modules/home/repositories/apiadvisor_repository.dart';
import 'package:arquitetura/app/modules/home/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter_modular/flutter_modular.dart';



class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get())),
        Bind((i) => ApiadvisorViewModel(i.get())),
        Bind<IApiAdvisor>((i) => ApiAdvisorRepository(i.get<IClientHttp>())),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/',
          child: (context, args) => HomePage(),
        ),
      ];
}
