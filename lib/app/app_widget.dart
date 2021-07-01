import 'package:covid_tracker/app/app_controller.dart';
import 'package:covid_tracker/app/app_provider.dart';
import 'package:covid_tracker/app/countries/countries_view.dart';
import 'package:covid_tracker/app/landing/landing_view.dart';
import 'package:covid_tracker/app/tracker/tracker_view.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  late AppController appController;
  late Future loading;

  String get initialRoute =>
      appController.selectedCountry == null ? '/landing' : '/tracker';

  Future _load() async {
    await appProvider.allReady();
    appController = appProvider.get<AppController>();
    appController.retrieveSelectedCountry();
  }

  @override
  void initState() {
    loading = _load();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loading,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            initialRoute: initialRoute,
            routes: {
              '/landing': (context) => LandingView(),
              '/countries': (context) => CountriesView(),
              '/tracker': (context) => TrackerView(),
            },
          );
        } else {
          return Material(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
