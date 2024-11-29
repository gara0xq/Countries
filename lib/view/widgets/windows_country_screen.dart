import 'package:countries/model/country_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'details_content.dart';

// ignore: must_be_immutable
class WindowsCountryScreen extends StatelessWidget {
  CountryModel country;
  WindowsCountryScreen({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Image.network(
            country.flags.png,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(width: width / 12),
        Expanded(
          flex: 3,
          child: SizedBox(
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    country.name,
                    style: Get.textTheme.headlineLarge,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DetailsContent(
                          data: {
                            "Native Name": country.nativeName,
                            "Population": country.population.toString(),
                            "Region": country.region.name,
                            "Sub Region": country.subregion,
                            "Capital": country.capital ?? "No Capital",
                          },
                        ),
                      ),
                      Expanded(
                        child: DetailsContent(
                          data: {
                            "Top Level Domain": country.topLevelDomain.first,
                            "Currencies": country.currencies != []
                                ? "No Currencies"
                                : country.currencies![0].name,
                            "Languages": country.languages.first.name,
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Border Countries:",
                          style: Get.textTheme.bodyMedium,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: SizedBox(
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: country.borders == null
                                ? 0
                                : country.borders!.length,
                            itemBuilder: (_, i) {
                              return Container(
                                height: 40,
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.all(7),
                                width: 60,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Get.theme.colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  country.borders![i],
                                  style: Get.textTheme.bodySmall,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
