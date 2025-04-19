import 'package:bloc/bloc.dart';
import 'package:city_sphere/domain/entities/city.dart';
import 'package:city_sphere/domain/repositories/city_repo.dart';
import 'package:flutter/material.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final CityRepo cityRepo;
  CityBloc(this.cityRepo) : super(CityInitial()) {
    on<FetchCityData>((event, emit) async {
     emit(CityLoading());
     try{
       final cities = await cityRepo.getCityInfo();
       emit(CityLoaded(cities)) ;
     }catch(e){
       emit(CityError(e.toString()));
     }
    });
  }
}
