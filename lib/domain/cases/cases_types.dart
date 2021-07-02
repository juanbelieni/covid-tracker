import 'package:covid_tracker/domain/cases/cases_entity.dart';
import 'package:covid_tracker/domain/country/country_entity.dart';

abstract class ICasesRepository {
  Future<Cases> getCasesFromCountry(Country country);
}