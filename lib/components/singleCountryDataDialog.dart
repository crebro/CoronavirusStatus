import 'package:coronavirus_tracker/models/countryData.dart';
import 'package:coronavirus_tracker/services/stringService.dart';
import 'package:flutter/material.dart';

class SingleCountryDataDialog extends StatelessWidget {
  SingleCountryDataDialog({
    Key? key,
    required this.countryData,
  }) : super(key: key);

  final CountryData countryData;
  final StringService stringService = StringService();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
          height: 225,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    this.countryData.countryFlag,
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    this.countryData.countryName,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Total Confirmed: ${stringService.putCommasOnStringInt(this.countryData.totalConfirmed.toString())}",
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Active Cases: ${stringService.putCommasOnStringInt(this.countryData.totalActive.toString())}",
                style: TextStyle(fontSize: 17, color: Color(0xff00b4d8)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Total Recovered: ${stringService.putCommasOnStringInt(this.countryData.totalRecovered.toString())}",
                style: TextStyle(fontSize: 17, color: Color(0xff52b788)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Total Deaths: ${stringService.putCommasOnStringInt(this.countryData.totalDeaths.toString())}",
                style: TextStyle(fontSize: 17, color: Color(0xffd00000)),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          )),
    );
  }
}
