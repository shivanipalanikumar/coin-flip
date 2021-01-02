import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/outcomes.dart';

Future<Outcomes> calculate() {
  final Map<String, String> headers = {
    "x-rapidapi-key": "6a5640f000msh225738551f62ef9p1dc2e9jsnb2dd8535eb8b",
		"x-rapidapi-host": "coin-flip1.p.rapidapi.com",
  };
  final String url = "https://coin-flip1.p.rapidapi.com/headstails";
  return http.get(url, headers: headers).then((data) {
    if (data.statusCode == 200) {
      final jsonData = json.decode(data.body);
      return Outcomes.fromJson(jsonData);
    }
  }).catchError((e) {
    print(e.toString());
  });
}