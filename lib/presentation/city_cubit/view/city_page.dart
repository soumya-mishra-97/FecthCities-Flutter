import 'package:city_sphere/presentation/city_cubit/city_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityPage extends StatelessWidget {
  const CityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "City Sphere",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<CityCubit, CityState>(
        builder: (context, state) {
          if (state is CityLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CityLoaded) {
            final cities = state.cities;
            return ListView.builder(
              itemCount: cities.length,
              itemBuilder: (context, index) {
                final city = cities[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      city.cityName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Population: ${city.population}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Industries: ${city.economy.majorIndustries.join(', ')}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is CityError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text("Press button to load cities"));
          }
        },
      ),
    );
  }
}
