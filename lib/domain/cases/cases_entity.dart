class Cases {
  final int confirmed;
  final int recovered;
  final int deceased;

  Cases({
    required this.confirmed,
    required this.recovered,
    required this.deceased,
  });

  factory Cases.fromMap(Map map) {
    return Cases(
      confirmed: map['confirmed'],
      recovered: map['recovered'],
      deceased: map['deceased'],
    );
  }

  toMap() {
    return {
      'confirmed': confirmed,
      'recovered': recovered,
      'deceased': deceased,
    };
  }
}
