// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppController, Store {
  final _$selectedCountryAtom = Atom(name: '_AppController.selectedCountry');

  @override
  Country? get selectedCountry {
    _$selectedCountryAtom.reportRead();
    return super.selectedCountry;
  }

  @override
  set selectedCountry(Country? value) {
    _$selectedCountryAtom.reportWrite(value, super.selectedCountry, () {
      super.selectedCountry = value;
    });
  }

  final _$selectCountryAsyncAction =
      AsyncAction('_AppController.selectCountry');

  @override
  Future<dynamic> selectCountry(Country country) {
    return _$selectCountryAsyncAction.run(() => super.selectCountry(country));
  }

  final _$_AppControllerActionController =
      ActionController(name: '_AppController');

  @override
  void retrieveSelectedCountry() {
    final _$actionInfo = _$_AppControllerActionController.startAction(
        name: '_AppController.retrieveSelectedCountry');
    try {
      return super.retrieveSelectedCountry();
    } finally {
      _$_AppControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedCountry: ${selectedCountry}
    ''';
  }
}
