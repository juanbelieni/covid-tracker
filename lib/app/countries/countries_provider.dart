import 'package:covid_tracker/app/countries/countries_controller.dart';
import 'package:covid_tracker/infra/config/api_config.dart';
import 'package:covid_tracker/infra/repositories/country_repository.dart';
import 'package:get_it/get_it.dart';

final countriesProvider = GetIt.asNewInstance();

void setUpCountriesProvider() async {
  final countryRepository = CountryRepository(api: api);
  countriesProvider.registerSingleton(CountriesController(
    countryRepository: countryRepository,
  ));
}
