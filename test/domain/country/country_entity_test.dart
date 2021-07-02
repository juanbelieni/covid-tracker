import 'package:covid_tracker/domain/country/country_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final name = 'Brazil';
  final code = 'br';
  final continent = 'South America';
  final population = 100;

  test('it should create a correct country instance from constructor', () {
    final country = Country(
      code: code,
      name: name,
      continent: continent,
      population: population,
    );

    expect(country.code, code);
    expect(country.name, name);
    expect(country.continent, continent);
    expect(country.population, population);
  });

  test('it should create a correct country instance from map', () {
    final country = Country.fromMap({
      'code': code,
      'name': name,
      'continent': continent,
      'population': 100,
    });

    expect(country.code, code);
    expect(country.name, name);
    expect(country.continent, continent);
    expect(country.population, population);
  });

  test('it should fail when code has an uppercase letter', () {
    expect(
      () => Country(
        code: code.toUpperCase(),
        name: name,
        continent: continent,
        population: population,
      ),
      throwsAssertionError,
    );
  });
}
