import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  List<CityData> data;

  CityModel({required this.data});

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    data: List<CityData>.from(json["data"].map((x) => CityData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CityData {
  String cityName;
  int population;
  Economy economy;

  CityData({
    required this.cityName,
    required this.population,
    required this.economy,
  });

  factory CityData.fromJson(Map<String, dynamic> json) => CityData(
    cityName: json["city_name"],
    population: json["population"],
    economy: Economy.fromJson(json["economy"]),
  );

  Map<String, dynamic> toJson() => {
    "city_name": cityName,
    "population": population,
    "economy": economy.toJson(),
  };
}

class Economy {
  List<String> majorIndustries;

  Economy({required this.majorIndustries});

  factory Economy.fromJson(Map<String, dynamic> json) => Economy(
    majorIndustries: List<String>.from(json["major_industries"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "major_industries": List<dynamic>.from(majorIndustries.map((x) => x)),
  };
}
