import 'package:countries/model/country_model.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Services extends GetxController {
  List<CountryModel> countries = [];
  

  Future<List<CountryModel>> loadCountries() async {
    // Load the JSON string from the file
    String jsonString = await rootBundle.loadString('lib/utils/data.json');

    // Decode the JSON into a list of dynamic objects
    List<dynamic> jsonList = json.decode(jsonString);

    // Map each JSON object to a CountryModel instance
    countries = jsonList.map((json) => CountryModel.fromJson(json)).toList();

    return countries;
  }
}
