import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getDataInternet() async {
      Uri url = Uri.parse(
          "https://api.themoviedb.org/3/discover/movie?api_key=17b446c2190bd5ecad9e3efde877e42d&language=en-US&page=1");
      http.Response response = await http.get(url);
      print(response);
      print(response.statusCode);
      print(response.body);
      print("[1,2,3,4]");
    }

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              getDataInternet();
            },
            child: Text(
              "Get DATA",
            ),
          ),
        ),
      ),
    );
  }
}
