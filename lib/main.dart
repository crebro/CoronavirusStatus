import 'package:coronavirus_tracker/pages/home.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Coronavirus Data Tracker",
    home: HomePage(),
    theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.black),
        fontFamily: "Circular"),
  ));
}
