import 'package:covid_tracker/app/countries/countries_controller.dart';
import 'package:covid_tracker/infra/config/api_config.dart';
import 'package:covid_tracker/infra/repositories/country_repository.dart';
import 'package:get_it/get_it.dart';

void setUpCountriesProvider() async {
  final countryRepository = CountryRepository(api: api);
  GetIt.I.registerSingleton(CountriesController(
    countryRepository: countryRepository,
  ));
}
