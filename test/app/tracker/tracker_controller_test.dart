import 'package:covid_tracker/app/app_controller.dart';
import 'package:covid_tracker/app/tracker/tracker_controller.dart';
import 'package:covid_tracker/domain/cases/cases_entity.dart';
import 'package:covid_tracker/domain/cases/cases_types.dart';
import 'package:covid_tracker/domain/country/country_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCasesRepository extends Mock implements ICasesRepository {}

class MockAppController extends Mock implements AppController {}

void main() {
  late ICasesRepository casesRepository;
  late AppController appController;
  late Cases cases;
  late Country country;

  setUp(() {
    casesRepository = MockCasesRepository();
    appController = MockAppController();
    cases = Cases(
      confirmed: 300,
      recovered: 200,
      deceased: 100,
    );
    country = Country(
      name: 'Brazil',
      code: 'br',
      continent: 'South America',
      population: 100,
    );
  });

  test('it should fetch cases', () async {
    when(() => casesRepository.getCasesFromCountry(country))
        .thenAnswer((_) => Future.value(cases));

    final trackerController = TrackerController(
      casesRepository: casesRepository,
      appController: appController,
    );
    await trackerController.fetchCases(country);

    expect(trackerController.cases, cases);
  });
}
