import 'package:coronavirus_tracker/components/singleCountryDataTile.dart';
import 'package:coronavirus_tracker/models/countryData.dart';
import 'package:coronavirus_tracker/services/apiService.dart';
import 'package:flutter/material.dart';

class AllCountriesData extends StatefulWidget {
  @override
  _AllCountriesDataState createState() => _AllCountriesDataState();
}

class _AllCountriesDataState extends State<AllCountriesData> {
  ApiService apiService = ApiService();
  bool searching = false;
  List<CountryData> countriesData = [];
  List<CountryData> searchData = [];

  @override
  void initState() {
    getAllCountriesData();
    super.initState();
  }

  Future<void> getAllCountriesData() async {
    List<CountryData> response = await apiService.getCountriesData();
    setState(() {
      this.countriesData = response;
    });
  }

  void searchWithQuery(String q) {
    if (q == "") {
      setState(() {
        this.searching = false;
        this.searchData = [];
      });
    } else {
      List<CountryData> tempData = countriesData
          .where((element) =>
              element.countryName.toLowerCase().startsWith(q.toLowerCase()))
          .toList();
      setState(() {
        if (!this.searching) {
          this.searching = true;
        }
        this.searchData = tempData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(hintText: "Seach Countries Here"),
          onChanged: (value) {
            searchWithQuery(value);
          },
        ),
        Expanded(
          child: !searching
              ? ListView.builder(
                  itemCount: this.countriesData.length,
                  itemBuilder: (context, index) {
                    CountryData country = this.countriesData[index];
                    return SingleCountryDataTile(countryData: country);
                  })
              : ListView.builder(
                  itemCount: this.searchData.length,
                  itemBuilder: (context, index) {
                    CountryData country = this.searchData[index];
                    return SingleCountryDataTile(countryData: country);
                  }),
        ),
      ],
    );
  }
}
