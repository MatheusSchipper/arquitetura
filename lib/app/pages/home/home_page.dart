import 'package:arquitetura/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'components/custom_switch_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final controller = HomeController(
  //   ApiadvisorViewModel(
  //     ApiAdvisorRepository(
  //       ClientHttpService(),
  //     ),
  //   ),
  // );
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Home Page')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.getWeather();
          },
          child: Icon(Icons.search),
        ),
        body: Center(
          child: Column(
            children: [
              CustomSwitchWidget(),
              ValueListenableBuilder(
                valueListenable: controller.weather,
                builder: (BuildContext context, dynamic value, Widget child) {
                  if (value?.text == null)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  return Text(value.text);
                },
              ),
            ],
          ),
        ));
  }
}
