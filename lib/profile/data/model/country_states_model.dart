class CountryState {
  String? code2;
  String? code3;
  String? name;
  String? capital;
  String? region;
  String? subregion;
  List<CountryStateStates>? states;

  CountryState(
      {this.code2,
      this.code3,
      this.name,
      this.capital,
      this.region,
      this.subregion,
      this.states});

  CountryState.fromJson(Map<String, dynamic> json) {
    code2 = json['code2'];
    code3 = json['code3'];
    name = json['name'];
    capital = json['capital'];
    region = json['region'];
    subregion = json['subregion'];
    if (json['states'] != null) {
      states = <CountryStateStates>[];
      json['states'].forEach((v) {
        states!.add(new CountryStateStates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code2'] = this.code2;
    data['code3'] = this.code3;
    data['name'] = this.name;
    data['capital'] = this.capital;
    data['region'] = this.region;
    data['subregion'] = this.subregion;
    if (this.states != null) {
      data['states'] = this.states!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CountryStateStates {
  String? code;
  String? name;
  String? subdivision;

  CountryStateStates({this.code, this.name, this.subdivision});

  CountryStateStates.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    subdivision = json['subdivision'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['subdivision'] = this.subdivision;
    return data;
  }
}
