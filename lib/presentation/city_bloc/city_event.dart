part of 'city_bloc.dart';

@immutable
sealed class CityEvent {}

class FetchCityData extends CityEvent{}
