import 'package:covid_tracker/domain/cases/cases_entity.dart';
import 'package:covid_tracker/domain/cases/cases_types.dart';
import 'package:covid_tracker/domain/country/country_entity.dart';
import 'package:dio/dio.dart';

class CasesRepository implements ICasesRepository {
  final Dio api;

  CasesRepository({required this.api});

  @override
  Future<Cases> getCasesFromCountry(Country country) async {
    const url = 'https://covid-api.mmediagroup.fr/v1/cases';
    final response = await this.api.get(
      url,
      queryParameters: {'country': country.name},
    );
    final Map data = response.data;

    final cases = Cases(
      confirmed: data['All']['confirmed'],
      recovered: data['All']['recovered'],
      deceased: data['All']['deaths'],
    );

    return cases;
  }
}
