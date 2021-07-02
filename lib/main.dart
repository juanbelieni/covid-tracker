import 'package:covid_tracker/app/app_provider.dart';
import 'package:covid_tracker/app/app_widget.dart';
import 'package:covid_tracker/app/countries/countries_provider.dart';
import 'package:covid_tracker/app/tracker/tracker_provider.dart';
import 'package:flutter/material.dart';

void main() {
  setUpAppProvider();
  setUpCountriesProvider();
  setUpTrackerProvider();
  runApp(AppWidget());
}
