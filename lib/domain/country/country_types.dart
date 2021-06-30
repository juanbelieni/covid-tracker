import 'package:covid_tracker/domain/country/country_entity.dart';

abstract class ICountryRepository {
  Future<List<Country>> getAllCountries();
}