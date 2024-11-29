import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DetailsContent extends StatelessWidget {
  Map<String, String> data;
  DetailsContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (_, i) {
          return Row(
            children: [
              Text(
                "${data.keys.elementAt(i)} : ",
                style: Get.textTheme.bodyMedium,
              ),
              Text(
                data.values.elementAt(i),
                style: Get.textTheme.bodySmall,
              ),
            ],
          );
        },
      ),
    );
  }
}
