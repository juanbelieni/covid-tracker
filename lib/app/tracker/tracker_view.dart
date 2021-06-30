import 'package:covid_tracker/app/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TrackerView extends StatefulWidget {
  @override
  _TrackerViewState createState() => _TrackerViewState();
}

class _TrackerViewState extends State<TrackerView> {
  late AppController appController;

  @override
  Widget build(BuildContext context) {
    appController = Provider.of<AppController>(context);

    return Material(
      child: Observer(
        builder: (context) {
          return Center(
            child: Text(appController.selectedCountry!.name),
          );
        },
      ),
    );
  }
}
