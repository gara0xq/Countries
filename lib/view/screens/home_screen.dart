import 'package:countries/controller/app_controller.dart';
import 'package:countries/view/widgets/home_country_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  TextEditingController search = TextEditingController();
  HomeScreen({super.key});

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
                child: ListView(
                  children: [
                    Container(
                        height: width > 700 ? 50 : 120,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection:
                              width > 700 ? Axis.horizontal : Axis.vertical,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              width: 400,
                              decoration: BoxDecoration(
                                color: Get.theme.colorScheme.secondary,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: TextFormField(
                                controller: search,
                                onChanged: (value) {
                                  controller.search(value);
                                },
                                decoration: InputDecoration(
                                  icon: const Icon(Icons.search),
                                  hintText: "Search for a country..",
                                  hintStyle: Get.theme.textTheme.bodyMedium,
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              width: width > 700 ? width - 440 : width,
                              padding: width > 700
                                  ? const EdgeInsets.all(0)
                                  : const EdgeInsets.only(top: 20),
                              alignment: width > 700
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Container(
                                height: 50,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Get.theme.colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: PopupMenuButton(
                                  initialValue: controller.region,
                                  child: Container(
                                    margin:
                                       const EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Get.theme.colorScheme.secondary,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller.region == "All"
                                              ? "Filter by Region"
                                              : controller.region,
                                          style: Get.theme.textTheme.bodySmall,
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: controller.isDarkMode
                                              ? Colors.white
                                              : Colors.black,
                                          size: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                  onSelected: (value) {
                                    controller.filterWithRegion(value);
                                  },
                                  itemBuilder: (context) => <PopupMenuItem>[
                                    const PopupMenuItem(
                                      value: "All",
                                      child: Text("All"),
                                    ),
                                    const PopupMenuItem(
                                      value: "Africa",
                                      child: Text("Africa"),
                                    ),
                                    const PopupMenuItem(
                                      value: "Americas",
                                      child: Text("America"),
                                    ),
                                    const PopupMenuItem(
                                      value: "Asia",
                                      child: Text("Asia"),
                                    ),
                                    const PopupMenuItem(
                                      value: "Europe",
                                      child: Text("Europe"),
                                    ),
                                    const PopupMenuItem(
                                      value: "Oceania",
                                      child: Text("Oceania"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                    controller.filteredCountries.isEmpty
                        ? Container(
                            height: height - 200,
                            alignment: Alignment.center,
                            child: Text(
                              "No Countries Available",
                              style: Get.textTheme.bodyMedium,
                            ),
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.filteredCountries.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: width < 700
                                  ? 1
                                  : width < 1100
                                      ? 2
                                      : width < 1400
                                          ? 3
                                          : width < 1800
                                              ? 4
                                              : 5,
                            ),
                            itemBuilder: (_, i) {
                              return HomeCountryBox(
                                controller: controller,
                                country: controller.filteredCountries[i],
                              );
                            },
                          ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
