class City {
  final String cityName;
  final int population;
  final EconomyCity economy;

  City({
    required this.cityName,
    required this.population,
    required this.economy,
  });
}

class EconomyCity {
  final List<String> majorIndustries;

  EconomyCity({required this.majorIndustries});
}
