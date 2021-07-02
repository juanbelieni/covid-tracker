class Country {
  final String code;
  final String name;
  final String continent;
  final int population;

  Country({
    required this.code,
    required this.name,
    required this.continent,
    required this.population,
  }) : assert(RegExp(r'^[a-z]+$').hasMatch(code));

  factory Country.fromMap(Map map) {
    return Country(
      code: map['code'],
      name: map['name'],
      continent: map['continent'],
      population: map['population'],
    );
  }

  toMap() {
    return {
      'code': code,
      'name': name,
      'continent': continent,
      'population': population,
    };
  }
}
