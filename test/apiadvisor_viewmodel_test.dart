import 'package:arquitetura/app/app_module.dart';
import 'package:arquitetura/app/interfaces/client_http_interface.dart';
import 'package:arquitetura/app/models/apiadvisor_model.dart';
import 'package:arquitetura/app/repositories/apiadvisor_repository.dart';
import 'package:arquitetura/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class ClientHttpMockSuccess implements IClientHttp {
//   @override
//   void addToken(String token) {}

//   @override
//   Future get(String url) async {
//     return [
//       ApiadvisorModel(country: "BR", date: "2020-06-03", text: "Sucesso")
//           .toJson(),
//     ];
//   }
// }

// class ClientHttpMockError implements IClientHttp {
//   @override
//   void addToken(String token) {}

//   @override
//   Future get(String url) async {
//     return [];
//   }
// }

class ClientHttpMockito extends Mock implements IClientHttp {}

main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  // final mock = ClientHttpMockito();
  // final viewModel = ApiadvisorViewModel(
  //   ApiAdvisorRepository(
  //     mock,
  //     //ClientHttpMockError(),
  //   ),
  // );
  initModule(AppModule(), changeBinds: [
    Bind<IClientHttp>((i) => ClientHttpMockito()),
  ]);

  final mock = Modular.get<IClientHttp>();
  final viewModel = Modular.get<ApiadvisorViewModel>();
  test('ApiadvisorViewModel error', () async {
    when(mock.get(
            "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=260f8313822d957c9a320f5cdfc83fa8"))
        .thenThrow(Exception("Erro"));

    await viewModel.fill();
    expect(viewModel.apiadvisorModel.value, null);
  });

  test('ApiadvisorViewModel success', () async {
    when(mock.get(
            "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=260f8313822d957c9a320f5cdfc83fa8"))
        .thenAnswer((_) => Future.value([
              ApiadvisorModel(
                      country: "BR", date: "2020-06-03", text: "Sucesso")
                  .toJson()
            ]));

    await viewModel.fill();
    expect(viewModel.apiadvisorModel.value, isA<ApiadvisorModel>());
  });
}
