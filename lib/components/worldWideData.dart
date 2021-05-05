import 'package:coronavirus_tracker/components/statusCard.dart';
import 'package:coronavirus_tracker/components/worldDataMap.dart';
import 'package:coronavirus_tracker/services/apiService.dart';
import 'package:coronavirus_tracker/services/stringService.dart';
import 'package:flutter/material.dart';

class WorldWideData extends StatefulWidget {
  @override
  _WorldWideDataState createState() => _WorldWideDataState();
}

class _WorldWideDataState extends State<WorldWideData> {
  ApiService apiService = ApiService();
  StringService stringService = StringService();
  int? totalConfirmed;
  int? totalActive;
  int? totalRecovered;
  int? totalDeaths;

  @override
  void initState() {
    getGlobalRecords();
    super.initState();
  }

  Future<void> getGlobalRecords() async {
    Map<String, dynamic> response = await apiService.getGlobalData();
    setState(() {
      this.totalConfirmed = response["cases"];
      this.totalActive = response['active'];
      this.totalRecovered = response['recovered'];
      this.totalDeaths = response['deaths'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "World Wide Data",
                style: TextStyle(fontSize: 18),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WorldDataMap()));
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Color(0xff00b4d8),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "View Map",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: StatusCard(
                        cardColor: Color(0xff000814),
                        title: "Confirmed",
                        value: this.totalConfirmed != null
                            ? stringService.putCommasOnStringInt(
                                this.totalConfirmed.toString())
                            : "Loading ..."),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: StatusCard(
                        cardColor: Color(0xff00b4d8),
                        title: "Active Cases",
                        value: this.totalActive != null
                            ? stringService.putCommasOnStringInt(
                                this.totalActive.toString())
                            : "Loading ..."),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: StatusCard(
                        cardColor: Color(0xff52b788),
                        title: "Recovered",
                        value: this.totalRecovered != null
                            ? stringService.putCommasOnStringInt(
                                this.totalRecovered.toString())
                            : "Loading ..."),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: StatusCard(
                        cardColor: Color(0xffd00000),
                        title: "Deaths",
                        value: this.totalDeaths != null
                            ? stringService.putCommasOnStringInt(
                                this.totalDeaths.toString())
                            : "Loading ..."),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
