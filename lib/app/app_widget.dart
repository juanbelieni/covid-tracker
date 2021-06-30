import 'package:covid_tracker/app/app_controller.dart';
import 'package:covid_tracker/app/countries/countries_view.dart';
import 'package:covid_tracker/app/landing/landing_view.dart';
import 'package:covid_tracker/app/tracker/tracker_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  late AppController appController;

  _AppWidgetState() {
    final prefsFuture = SharedPreferences.getInstance();
    appController = AppController(prefsFuture: prefsFuture);
  }

  @override
  void initState() {
    appController.retrieveSelectedCountry();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppController>(
          create: (context) => appController,
        ),
      ],
      child: MaterialApp(
        initialRoute: '/landing',
        routes: {
          '/landing': (context) => LandingView(),
          '/countries': (context) => CountriesView(),
          '/tracker': (context) => TrackerView(),
        },
      ),
    );
  }
}
