import 'package:coronavirus_tracker/components/allCountriesData.dart';
import 'package:coronavirus_tracker/components/applicationBar.dart';
import 'package:coronavirus_tracker/components/worldWideData.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            ApplicationBar(),
            Container(margin: EdgeInsets.only(top: 10), child: WorldWideData()),
            SizedBox(
              height: 10,
            ),
            Expanded(child: AllCountriesData())
          ],
        ),
      )),
    );
  }
}
