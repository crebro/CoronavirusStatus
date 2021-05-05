import 'package:coronavirus_tracker/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WorldDataMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Covid Map Data"),
        ),
        body: Column(
          children: [
            Expanded(
              child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: worldDataMapEmbedUrl,
              ),
            ),
          ],
        ));
  }
}
