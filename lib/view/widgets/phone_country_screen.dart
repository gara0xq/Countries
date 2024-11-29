import 'package:countries/model/country_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'details_content.dart';

// ignore: must_be_immutable
class PhoneCountryScreen extends StatelessWidget {
  CountryModel country;
  PhoneCountryScreen({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
                const Spacer(),
                Expanded(
                  child: Text(
                    country.name,
                    style: Get.textTheme.headlineLarge,
                  ),
                ),
                Expanded(
                  flex: 3,
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
                  flex: 2,
                  child: DetailsContent(
                    data: {
                      "Top Level Domain": country.topLevelDomain.first,
                      "Currencies": country.currencies != []
                          ? "No Currencies"
                          : country.currencies![0].name,
                      "Languages": country.languages.first.name,
                    },
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Border Countries:",
                    style: Get.textTheme.bodyMedium,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          country.borders == null ? 0 : country.borders!.length,
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
        ),
      ],
    );
  }
}
