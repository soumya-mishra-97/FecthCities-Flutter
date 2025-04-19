import 'package:city_sphere/domain/entities/city.dart';
import 'package:city_sphere/domain/repositories/city_repo.dart';

class GetCityInfo{
  final CityRepo cityRepo;

  GetCityInfo({required this.cityRepo});

  Future<List<City>> call() async{
    return await cityRepo.getCityInfo();
  }
}