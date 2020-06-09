import 'package:arquitetura/app/modules/home/models/apiadvisor_model.dart';

abstract class IApiAdvisor {
  Future<ApiadvisorModel> getWeather();
}