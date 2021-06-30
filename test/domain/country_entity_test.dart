import 'package:covid_tracker/domain/country/country_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final name = 'Brazil';
  final code = 'br';
  final continent = 'South America';

  test('it should create a correct country object from constructor', () {
    final country = Country(code: code, name: name, continent: continent);

    expect(country.code, code);
    expect(country.name, name);
    expect(country.continent, continent);
  });

  test('it should create a correct country object from map', () {
    final country = Country.fromMap({
      'code': code,
      'name': name,
      'continent': continent,
    });

    expect(country.code, code);
    expect(country.name, name);
    expect(country.continent, continent);
  });

  test('it should fail when code has an uppercase letter', () {
    expect(
      () => Country(
        code: code.toUpperCase(),
        name: name,
        continent: continent,
      ),
      throwsAssertionError,
    );
  });
}
