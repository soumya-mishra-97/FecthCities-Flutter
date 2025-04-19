import 'package:city_sphere/domain/entities/city.dart';

abstract class CityRepo{
  Future<List<City>> getCityInfo();
}