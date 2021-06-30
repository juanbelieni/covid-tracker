// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CountriesController on _CountriesController, Store {
  final _$countriesAtom = Atom(name: '_CountriesController.countries');

  @override
  ObservableFuture<List<Country>> get countries {
    _$countriesAtom.reportRead();
    return super.countries;
  }

  @override
  set countries(ObservableFuture<List<Country>> value) {
    _$countriesAtom.reportWrite(value, super.countries, () {
      super.countries = value;
    });
  }

  final _$_CountriesControllerActionController =
      ActionController(name: '_CountriesController');

  @override
  void fetchCountries() {
    final _$actionInfo = _$_CountriesControllerActionController.startAction(
        name: '_CountriesController.fetchCountries');
    try {
      return super.fetchCountries();
    } finally {
      _$_CountriesControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
countries: ${countries}
    ''';
  }
}
