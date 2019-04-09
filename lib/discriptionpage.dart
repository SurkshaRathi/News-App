import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class DescriptionPage extends StatefulWidget {
  final String urlnews;
  DescriptionPage(this.urlnews);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DiscriptionState(urlnews);
  }
}

class DiscriptionState extends State<DescriptionPage> {
  final String urls;
  DiscriptionState(this.urls);

  // Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WebviewScaffold(
      appBar: AppBar(
        title: Text("BCC News"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      url: urls,
      withZoom: true,
    );
  }
}
