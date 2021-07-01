import 'dart:convert';

import 'package:covid_tracker/app/app_controller.dart';
import 'package:covid_tracker/domain/country/country_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late SharedPreferences prefs;
  late Country country;

  setUp(() {
    prefs = MockSharedPreferences();
    country = Country(
      name: 'Brazil',
      code: 'br',
      continent: 'South America',
    );
  });

  test('it should retrieve selected country', () {
    when(() => prefs.getString('country'))
        .thenReturn(json.encode(country.toMap()));

    final appController = AppController(prefs: prefs);
    appController.retrieveSelectedCountry();

    expect(appController.selectedCountry, isNotNull);
    expect(appController.selectedCountry!.name, country.name);
    expect(appController.selectedCountry!.code, country.code);
    expect(appController.selectedCountry!.continent, country.continent);
  });

  test('it should select country', () async {
    when(() => prefs.setString('country', any()))
        .thenAnswer((_) => Future.value(true));

    final appController = AppController(prefs: prefs);
    await appController.selectCountry(country);

    expect(appController.selectedCountry, country);
    verify(() => prefs.setString('country', any())).called(1);
  });
}
