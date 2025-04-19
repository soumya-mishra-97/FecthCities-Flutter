import 'package:city_sphere/core/network/dio_client.dart';
import 'package:city_sphere/data/repositories/city_repository_impl.dart';
import 'package:city_sphere/domain/repositories/city_repo.dart';
import 'package:city_sphere/presentation/city_bloc/city_bloc.dart';
import 'package:city_sphere/presentation/city_bloc/view/city_page.dart';
//import 'package:city_sphere/presentation/city_cubit/city_cubit.dart';
//import 'package:city_sphere/presentation/city_cubit/view/city_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(CityApp());
}

class CityApp extends StatelessWidget {
  const CityApp({super.key});

  @override
  Widget build(BuildContext context) {
    final DioClient dioClient = DioClient();
    final CityRepo cityRepo = CityRepoImpl(dioClient: dioClient);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'City Sphere',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: BlocProvider(
        create: (_) => CityBloc(cityRepo)..add(FetchCityData()),
        //create: (_) =>  CityCubit(cityRepo)..fetchCities(),
        child: CityPage(),
      ),
    );
  }
}
