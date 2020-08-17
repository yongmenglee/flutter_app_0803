// Section 21 - Connecting to the World - Networking in Flutter

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class JsonParsingSimple extends StatefulWidget {
  @override
  _JsonParsingSimpleState createState() => _JsonParsingSimpleState();
}

class _JsonParsingSimpleState extends State<JsonParsingSimple> {
  Future data;

  // Override init state.
  // happens before the UI is set.
  @override
  void initState() {
    super.initState();
    data = getData();
  }

  @override
  // build: render UI
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parsing Json"),
      ),
      body: Center(
        child: Container(
          // FutureBuilder: for future objects
          child: FutureBuilder(
            future: getData(),
            // Manually assign type to snapshot
            builder: (context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
//                return Text(snapshot.data[0]["title"]);
//                return Text(snapshot.data[0]["userId"].toString());
                return createListView(snapshot.data, context);
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  Future getData() async {
    var data;
    String url = "https://jsonplaceholder.typicode.com/posts";
    Network network = Network(url);

    data = network.fetchData();
    // For demonstration purpose: .then()
//    data = network.fetchData().then((value) => {
//      print(value[0]['title'])
//    });

    // Note: prints "Instance of 'Future<dynamics>'".
    // - The app is not sure what is the data to be received at the point
    // this code is run.
//    print(data);

    return data;
  }

  Widget createListView(List data, BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Divider(height: 5.0,),
                ListTile(
                  title: Text("${data[index]["title"]}"),
                  subtitle: Text("${data[index]["body"]}"),
                  leading: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.black26,
                        radius: 23,
                        child: Text("${data[index]["id"]}"),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}

/// Fetch data from URL
class Network {
  final String url;

  Network(this.url);

  /// To get the JSON object, async => Future type
  Future fetchData() async {
    print("$url");

    // Successful or Error
    // Note: Uri.encodeFull() => to address case where
    // special characters appears in the url via percent-encoding.
    Response response = await get(Uri.encodeFull(url));

    // 200 => Default status code (good)
    if (response.statusCode == 200) {
      // Cut-off @ certain point => it only gives us some ideas on
      // what we are receiving.
//      print(response.body);

      // decode: convert response.body (from String) into json object.
      return json.decode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
