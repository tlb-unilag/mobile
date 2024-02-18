class Country {
  List<CountryState>? states;
  String? name;
  String? iso2;
  String? iso3;
  String? frenchname;
  int? countrycode;
  String? phoneCode, currencyName, currencySymbol, tld, region, emoji, emojiU;

  Country({
    this.states,
    this.name,
    this.iso2,
    this.iso3,
    this.phoneCode,
    this.currencyName,
    this.currencySymbol,
    this.tld,
    this.region,
    this.emoji,
    this.emojiU,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    var states = <CountryState>[];
    json["states"].forEach((st) => states.add(CountryState.fromJson(st)));
    return Country(
      states: states,
      region: json["region"] as String,
      name: json["name"] as String,
      iso2: json["iso2"] as String,
      iso3: json["iso3"] as String,
      phoneCode: json["phone_code"] as String,
      currencyName: json["currency_name"] as String,
      currencySymbol: json["currency_symbol"] as String,
      tld: json["tld"] as String,
      emoji: json["emoji"] as String,
      emojiU: json["emojiU"] as String,
    );
  }
}

class CountryState {
  final String name, stateCode;

  CountryState({
    required this.name,
    required this.stateCode,
  });

  factory CountryState.fromJson(Map<String, dynamic> json) {
    return CountryState(
      name: json['name'] as String,
      stateCode: json['state_code'] as String,
    );
  }
}
