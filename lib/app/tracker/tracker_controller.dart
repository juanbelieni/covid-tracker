import 'package:covid_tracker/app/app_controller.dart';
import 'package:covid_tracker/domain/cases/cases_entity.dart';
import 'package:covid_tracker/domain/cases/cases_types.dart';
import 'package:covid_tracker/domain/country/country_entity.dart';
import 'package:mobx/mobx.dart';

part 'tracker_controller.g.dart';

class TrackerController = _TrackerController with _$TrackerController;

abstract class _TrackerController with Store {
  final ICasesRepository casesRepository;
  final AppController appController;

  @observable
  Cases? cases;

  _TrackerController({
    required this.casesRepository,
    required this.appController,
  }) {
   reaction<Country?>((_) => appController.selectedCountry, (Country? country) async {
     if (country != null) {
       cases = null;
       fetchCases(country);
     }
   });
  }

  @action
  Future fetchCases(Country country) async {
    cases = await casesRepository.getCasesFromCountry(country);
  }
}
