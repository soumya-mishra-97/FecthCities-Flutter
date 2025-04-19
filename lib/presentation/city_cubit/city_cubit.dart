import 'package:bloc/bloc.dart';
import 'package:city_sphere/domain/entities/city.dart';
import 'package:city_sphere/domain/repositories/city_repo.dart';
import 'package:flutter/material.dart';

part 'city_state.dart';

class CityCubit extends Cubit<CityState> {
  final CityRepo cityRepo;

  CityCubit(this.cityRepo) : super(CityInitial());

  Future<void> fetchCities() async {
    emit(CityLoading());
    try {
      final cities = await cityRepo.getCityInfo();
      emit(CityLoaded(cities));
    } catch (e) {
      emit(CityError("Failed to fetch data: ${e.toString()}"));
    }
  }
}