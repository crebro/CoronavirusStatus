class CountryData {
  int totalConfirmed;
  int totalActive;
  int totalRecovered;
  int totalDeaths;
  String countryName;
  String countryFlag;
  CountryData(
      {required this.countryName,
      required this.totalActive,
      required this.totalConfirmed,
      required this.totalDeaths,
      required this.totalRecovered,
      required this.countryFlag});
}
