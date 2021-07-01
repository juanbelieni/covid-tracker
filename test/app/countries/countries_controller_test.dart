import 'package:covid_tracker/app/countries/countries_controller.dart';
import 'package:covid_tracker/domain/country/country_entity.dart';
import 'package:covid_tracker/domain/country/country_types.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCountryRepository extends Mock implements ICountryRepository {}

void main() {
  late ICountryRepository countryRepository;
  late Country country;

  setUp(() {
    countryRepository = MockCountryRepository();
    country = Country(
      name: 'Brazil',
      code: 'br',
      continent: 'South America',
    );
  });

  test('it should fetch countries', () async {
    when(() => countryRepository.getAllCountries())
        .thenAnswer((_) => Future.value([country]));

    final countriesController = CountriesController(
      countryRepository: countryRepository,
    );
    await countriesController.fetchCountries();

    expect(countriesController.countries.length, 1);
    expect(countriesController.countries[0], country);
  });
}
