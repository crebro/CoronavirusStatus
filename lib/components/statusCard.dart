import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final Color cardColor;
  final String title;
  final String value;
  StatusCard(
      {required this.cardColor, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: this.cardColor, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 18, color: Colors.white),
          )
        ],
      ),
    );
  }
}
