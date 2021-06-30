class Country {
  final String code;
  final String name;
  final String continent;

  Country({
    required this.code,
    required this.name,
    required this.continent,
  }) : assert(RegExp(r'^[a-z]+$').hasMatch(code));

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      code: map['code'],
      name: map['name'],
      continent: map['continent'],
    );
  }

  toMap() {
    return {
      'code': code,
      'name': name,
      'continent': continent,
    };
  }
}
