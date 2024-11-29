import 'package:countries/model/country_model.dart';
import 'package:countries/view/widgets/phone_country_screen.dart';
import 'package:countries/view/widgets/windows_country_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/app_controller.dart';

// ignore: must_be_immutable
class CountryScreen extends StatelessWidget {
  CountryModel country;
  CountryScreen({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<AppController>(
      init: AppController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Get.theme.colorScheme.primary,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                color: Get.theme.colorScheme.secondary,
                child: Row(
                  children: [
                    Text(
                      "Where in the world?",
                      style: Get.theme.textTheme.headlineLarge,
                    ),
                    const Spacer(),
                    Semantics(
                      container: true,
                      child: Switch(
                        value: controller.isDarkMode,
                        onChanged: (value) {
                          controller.changeTheme(value);
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height - 60,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 35,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Get.theme.colorScheme.secondary,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade800,
                                  blurRadius: 3,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_back_rounded,
                                  color: controller.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                  size: 17,
                                ),
                                const SizedBox(width: 7),
                                Text(
                                  "Back",
                                  style: Get.textTheme.headlineMedium,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 70),
                        SizedBox(
                          height: width < 900 ? 750 : 350,
                          width: double.infinity,
                          child: width < 900
                              ? PhoneCountryScreen(country: country)
                              : WindowsCountryScreen(country: country),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
