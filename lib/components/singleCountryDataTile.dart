import 'package:coronavirus_tracker/components/singleCountryDataDialog.dart';
import 'package:coronavirus_tracker/models/countryData.dart';
import 'package:coronavirus_tracker/services/stringService.dart';
import 'package:flutter/material.dart';

class SingleCountryDataTile extends StatelessWidget {
  final CountryData countryData;
  final StringService stringService = StringService();
  SingleCountryDataTile({required this.countryData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.network(
                this.countryData.countryFlag,
                width: 30,
                height: 30,
              ),
              SizedBox(width: 10),
              Text(
                countryData.countryName.length < 20
                    ? countryData.countryName
                    : "${countryData.countryName.substring(0, 20)}..",
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                stringService.putCommasOnStringInt(
                    countryData.totalConfirmed.toString()),
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) =>
                          SingleCountryDataDialog(countryData: countryData));
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Color(0xff00b4d8),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "More",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
