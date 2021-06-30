import 'package:covid_tracker/app/app_controller.dart';
import 'package:covid_tracker/app/countries/countries_controller.dart';
import 'package:covid_tracker/domain/country/country_entity.dart';
import 'package:covid_tracker/infra/config/api_config.dart';
import 'package:covid_tracker/infra/repositories/country_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CountriesView extends StatefulWidget {
  @override
  _CountriesViewState createState() => _CountriesViewState();
}

class _CountriesViewState extends State<CountriesView> {
  late CountriesController countriesController;
  late AppController appController;

  List<Country>? get countries => countriesController.countries.value;

  _CountriesViewState() {
    final countryRepository = CountryRepository(api: api);
    countriesController = CountriesController(
      countryRepository: countryRepository,
    );
  }

  @override
  void initState() {
    countriesController.fetchCountries();
    super.initState();
  }

  selectCountry(BuildContext context, Country country) async {
    await appController.selectCountry(country);
    Navigator.of(context).pushReplacementNamed('/tracker');
  }

  @override
  Widget build(BuildContext context) {
    appController = Provider.of<AppController>(context);

    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select your country',
                style: GoogleFonts.poppins(fontSize: 32),
              ),
              SizedBox(height: 8),
              Expanded(
                child: Observer(
                  builder: (context) {
                    if (countries != null) {
                      return ListView.builder(
                        itemCount: countries!.length,
                        itemBuilder: (context, index) => Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: InkWell(
                            onTap: () {
                              selectCountry(context, countries![index]);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 32,
                                    height: 32,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/flags/${countries![index].code}.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        countries![index].name,
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        countries![index].continent,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
