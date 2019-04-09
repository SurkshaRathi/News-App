import 'package:flutter/material.dart';
import './discriptionpage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

String _apiURL =
    'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=4f17ee2a978248b98f53e0d74ee5b71e';
List _list1;
void main() async {
  _list1 = await fatchData(_apiURL);

  for (int i = 0; i < _list1.length; i++) {
    print(_list1[i]['title']);
  }
  runApp(MaterialApp(
    home: Page(),
  ));
}

class Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PageState();
  }
}

class PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
            padding: EdgeInsets.all(15.0),
            itemCount: _list1.length,
            itemBuilder: (BuildContext context, int position) {
              if (position.isOdd)
                return Divider(
                  color: Colors.red,
                );
              return ListTile(
                title: Text(
                  "${_list1[position]['title']}",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "${_list1[position]['description']}",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic),
                ),
                onTap: () {
                  var url = _list1[position]['url'];
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => DescriptionPage(url),
                      ));
                },
              );
            }),
      ),
    );
  }
}

Future<List> fatchData(String apiUrl) async {
  http.Response response = await http.get(apiUrl);
  return (json.decode(response.body))['articles'];
}
