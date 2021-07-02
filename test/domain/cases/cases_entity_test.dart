import 'package:covid_tracker/domain/cases/cases_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final confirmed = 300;
  final recovered = 200;
  final deceased = 100;

  test('it should create a correct cases instance from constructor', () {
    final cases = Cases(
      confirmed: confirmed,
      recovered: recovered,
      deceased: deceased,
    );

    expect(cases.confirmed, confirmed);
    expect(cases.recovered, recovered);
    expect(cases.deceased, deceased);
  });

  test('it should create a correct cases instance from map', () {
    final cases = Cases.fromMap({
      'confirmed': confirmed,
      'recovered': recovered,
      'deceased': deceased,
    });

    expect(cases.confirmed, confirmed);
    expect(cases.recovered, recovered);
    expect(cases.deceased, deceased);
  });
}
