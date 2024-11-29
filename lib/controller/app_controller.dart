import 'package:countries/controller/services.dart';
import 'package:countries/model/country_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  bool isDarkMode = true;
  Services controller = Get.put(Services());
  List<CountryModel> countries = [];
  List<CountryModel> filteredCountries = [];
  List<CountryModel> filteredCountriesRegion = [];
  List<CountryModel> filteredCountriesSearch = [];
  ValueNotifier<bool> fetchDataListener = ValueNotifier(false);
  String region = "All";
  String searchVar = "";

  @override
  void onInit() async {
    await controller.loadCountries();
    countries = controller.countries;
    filterWithRegion(region);
    search(searchVar);
    fetchDataListener.value = true;
    update();
    super.onInit();
  }

  Future changeTheme(bool value) async {
    isDarkMode = value;
    if (isDarkMode) {
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      Get.changeThemeMode(ThemeMode.light);
    }
    await Future.delayed(const Duration(milliseconds: 200));
    update();
  }

  search(String value) {
    searchVar = value;
    filteredCountriesSearch = countries
        .where((e) => e.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
    filterWithRegion(region);
    update();
  }

  filterWithRegion(String value) {
    region = value;
    if (value == "All") {
      filteredCountriesRegion = countries;
    } else {
      filteredCountriesRegion = countries
          .where((e) => e.region.name.toLowerCase() == value.toLowerCase())
          .toList();
    }

    filteredCountries = filteredCountriesRegion
        .where((e) => e.name.toLowerCase().contains(searchVar.toLowerCase()))
        .toList();

    update();
  }
}
