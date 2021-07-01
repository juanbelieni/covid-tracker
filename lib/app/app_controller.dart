import 'dart:convert';

import 'package:covid_tracker/domain/country/country_entity.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_controller.g.dart';

class AppController = _AppController with _$AppController;

abstract class _AppController with Store {
  final SharedPreferences prefs;

  @observable
  Country? selectedCountry;

  _AppController({
    required this.prefs,
  });

  @action
  Future retrieveSelectedCountry() async {
    final countryJson = await prefs.getString('country');
    if (countryJson != null) {
      final countryMap = json.decode(countryJson) as Map<String, dynamic>;
      this.selectedCountry = Country.fromMap(countryMap);
    }
  }

  @action
  Future selectCountry(Country country) async {
    final countryMap = country.toMap();
    final countryJson = json.encode(countryMap);
    await prefs.setString('country', countryJson);
    this.selectedCountry = country;
  }
}
