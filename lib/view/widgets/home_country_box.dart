import 'package:countries/controller/app_controller.dart';
import 'package:countries/model/country_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/country_screen.dart';

// ignore: must_be_immutable
class HomeCountryBox extends StatelessWidget {
  AppController controller;
  CountryModel country;
  HomeCountryBox({super.key, required this.controller, required this.country});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => CountryScreen(country: country));
      },
      splashColor: Colors.transparent,
      borderRadius: BorderRadius.circular(7),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Get.theme.colorScheme.secondary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: controller.fetchDataListener.value
                  ? Image.network(
                      country.flags.png,
                      fit: BoxFit.cover,
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    country.name,
                    style: Get.theme.textTheme.headlineMedium,
                    maxLines: 1,
                  ),
                  Row(
                    children: [
                      Text(
                        "Population :  ",
                        style: Get.theme.textTheme.bodyMedium,
                        maxLines: 1,
                      ),
                      Text(
                        country.population.toString(),
                        style: Get.theme.textTheme.bodySmall,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Region :  ",
                        style: Get.theme.textTheme.bodyMedium,
                        maxLines: 1,
                      ),
                      Text(
                        country.region.name,
                        style: Get.theme.textTheme.bodySmall,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Capital :  ",
                        style: Get.theme.textTheme.bodyMedium,
                        maxLines: 1,
                      ),
                      Text(
                        country.capital ?? "No Captital",
                        style: Get.theme.textTheme.bodySmall,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
