import 'package:covid_tracker/domain/country/country_entity.dart';
import 'package:covid_tracker/domain/country/country_types.dart';
import 'package:dio/dio.dart';

class CountryRepository implements ICountryRepository {
  final Dio api;

  CountryRepository({required this.api});

  @override
  Future<List<Country>> getAllCountries() async {
    const url = 'https://covid-api.mmediagroup.fr/v1/cases';
    final response = await this.api.get(url);
    final Map? data = response.data;

    final countries = data!.values
        .where((map) => map['All'] != null)
        .map((map) => map['All'])
        .where((map) => map['abbreviation'] != null)
        .map((map) => Country.fromMap({
              'code': (map['abbreviation'] as String).toLowerCase(),
              'name': map['country'],
              'continent': map['continent'],
            }))
        .toList();

    countries
        .sort((a, b) => (a.name.toLowerCase()).compareTo(b.name.toLowerCase()));

    return countries;
  }
}
