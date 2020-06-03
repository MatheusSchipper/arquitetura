import 'package:arquitetura/app/interfaces/client_http_interface.dart';
import 'package:arquitetura/app/models/apiadvisor_model.dart';
import 'package:arquitetura/app/repositories/apiadvisor_repository_interface.dart';

class ApiAdvisorRepository implements IApiAdvisor {
  
  final IClientHttp client;

  ApiAdvisorRepository(this.client);
  
  @override
  Future<ApiadvisorModel> getWeather() async {

    var json = await client.get("http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=260f8313822d957c9a320f5cdfc83fa8");

    ApiadvisorModel model = ApiadvisorModel.fromJson(json[0]);

    return model;
  }
  
}