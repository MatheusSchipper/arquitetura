import 'package:arquitetura/app/modules/home/interfaces/apiadvisor_repository_interface.dart';
import 'package:arquitetura/app/modules/home/models/apiadvisor_model.dart';
import 'package:flutter/material.dart';

class ApiadvisorViewModel {
  final IApiAdvisor repository;
  final apiadvisorModel = ValueNotifier<ApiadvisorModel>(null);

  ApiadvisorViewModel(this.repository);

  fill() async {
    try {
      apiadvisorModel.value = await repository.getWeather();
    } catch (e) {}
  }
}
