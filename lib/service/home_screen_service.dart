import 'dart:convert';

import 'package:covidapp/models/home_screen_model.dart';
import 'package:covidapp/screens/home_screen.dart';
import 'package:covidapp/screens/variable.dart';
import 'package:http/http.dart' as https;




Future<Covidmodel> getApi(String Country) async {
  final response =
      await https.get(Uri.parse('https://disease.sh/v3/covid-19/countries/$Country'));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print(data);
    return Covidmodel.fromJson(data);
  } else {
    throw Exception("Error");
  }
}
