import 'dart:convert';
import 'package:city_sphere/core/network/dio_client.dart';
//import 'package:city_sphere/core/network/enviroment.dart';
import 'package:city_sphere/data/models/city_model.dart';
import 'package:city_sphere/domain/entities/city.dart' show City, EconomyCity;
import 'package:city_sphere/domain/repositories/city_repo.dart';
import 'package:flutter/services.dart';

class CityRepoImpl implements CityRepo {
  final DioClient dioClient;

  CityRepoImpl({required this.dioClient});

  /*@override
  Future<List<City>> getCityInfo() async {
    try {
      final res = await dioClient.get(url);
      final model = CityModel.fromJson(res.data);
      return model.data.map((cityData) {
        return City(
          cityName: cityData.cityName,
          population: cityData.population,
          economy: EconomyCity(
            majorIndustries: List<String>.from(
              cityData.economy.majorIndustries,
            ),
          ),
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch city data $e');
    }
  }*/

  @override
  Future<List<City>> getCityInfo() async {
    final jsonStr = await rootBundle.loadString('assets/data/cities.json');
    final jsonMap = json.decode(jsonStr);

    final cityModel = CityModel.fromJson(jsonMap);
    return cityModel.data.map(
      (value) => City(
        cityName: value.cityName,
        population: value.population,
        economy: EconomyCity(
          majorIndustries: List<String>.from(value.economy.majorIndustries),
        ),
      ),
    ).toList();
  }
}
