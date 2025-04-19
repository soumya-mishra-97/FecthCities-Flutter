part of 'city_cubit.dart';

@immutable
sealed class CityState {}

final class CityInitial extends CityState {}

final class CityLoading extends CityState {}

final class CityLoaded extends CityState {
  final List<City> cities;
  CityLoaded(this.cities);
}

final class CityError extends CityState {
  final String message;
  CityError(this.message);
}
