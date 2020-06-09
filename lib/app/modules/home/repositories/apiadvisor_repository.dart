import 'package:arquitetura/app/core/interfaces/client_http_interface.dart';
import 'package:arquitetura/app/modules/home/interfaces/apiadvisor_repository_interface.dart';
import 'package:arquitetura/app/modules/home/models/apiadvisor_model.dart';

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