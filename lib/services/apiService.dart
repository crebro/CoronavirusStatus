import 'dart:convert';

import 'package:coronavirus_tracker/constants/constants.dart';
import 'package:coronavirus_tracker/models/countryData.dart';
import "package:coronavirus_tracker/services/httpService.dart";

class ApiService {
  Future<Map<String, dynamic>> getGlobalData() async {
    HttpService httpService =
        HttpService(requestLocation: worldCovidDataRequestLocation);
    var response = await httpService.getRequest();
    return jsonDecode(response.body);
  }

  Future<List<CountryData>> getCountriesData() async {
    HttpService httpService =
        HttpService(requestLocation: allCountriesCovidDataRequestLocation);
    var response = await httpService.getRequest();
    List<dynamic> jsonResponse = jsonDecode(response.body);
    List<CountryData> returnData = jsonResponse
        .map((countryData) => CountryData(
            countryFlag: countryData['countryInfo']['flag'],
            countryName: countryData['country'],
            totalActive: countryData['active'],
            totalConfirmed: countryData['cases'],
            totalDeaths: countryData['deaths'],
            totalRecovered: countryData['recovered']))
        .toList();
    return returnData;
  }
}
