import 'dart:convert';
import 'package:covid_tracker/model/countryapimodel.dart';
import 'package:covid_tracker/model/worldwidemodel.dart';
import 'package:http/http.dart' as http;

class WorldServies {
  Future<Worldwide> fetchWorldWideRecord() async {
    final response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/all'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return Worldwide.fromJson(data);
    } else {
      throw Exception('error');
    }
  }

  // ab ham ko sara data ni chahiy so ham model use ni krein gy
  // so is liy ham list jo dynamic ho gi us ko hit krein gy from data

  Future<List<dynamic>> countryapi() async {
    var data;
    final response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('error');
    }
  }
}

class Countrylistview {
  Future<Countrylistmodel> fetchcontrylist() async {
    final response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/country'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return Countrylistmodel.fromJson(data);
    } else {
      throw Exception('error');
    }
  }
}
