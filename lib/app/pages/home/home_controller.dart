

import 'package:arquitetura/app/models/apiadvisor_model.dart';
import 'package:arquitetura/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  
  final ApiadvisorViewModel viewModel;

  HomeController(this.viewModel);

  ValueNotifier<ApiadvisorModel> get weather => viewModel.apiadvisorModel;

  getWeather() async {
    await viewModel.fill();
  }
}