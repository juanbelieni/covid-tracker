import 'package:covid_tracker/domain/country/country_entity.dart';
import 'package:covid_tracker/domain/country/country_types.dart';
import 'package:mobx/mobx.dart';

part 'countries_controller.g.dart';

class CountriesController = _CountriesController with _$CountriesController;

abstract class _CountriesController with Store {
  final ICountryRepository countryRepository;

  @observable
  ObservableFuture<List<Country>> countries = ObservableFuture.value([]);

  _CountriesController({
    required this.countryRepository,
  });

  @action
  void fetchCountries() {
    final future = countryRepository.getAllCountries();
    this.countries = ObservableFuture(future);
  }
}
