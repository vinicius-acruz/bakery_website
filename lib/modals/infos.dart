import 'package:flutter/material.dart';

class Info {
  String title;
  String description;
  IconData iconData;

  Info(
      {required this.title, required this.description, required this.iconData});
}

List<Info> infos = [
  Info(
      title: 'Pick Meals',
      description:
          'Browse through our delectable menu and choose from a wide variety of mouthwatering meals. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      iconData: Icons.mouse_rounded),
  Info(
      title: 'Choose Payment',
      description:
          'Select your preferred payment method for a hassle-free checkout experience. We offer secure and convenient options for your transactions. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      iconData: Icons.monetization_on_outlined),
  Info(
      title: 'Select Address',
      description:
          'Provide your delivery address, and we will ensure your order reaches you at the right location. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      iconData: Icons.location_on_outlined),
  Info(
      title: 'Fast Delivery',
      description:
          'Experience quick and efficient delivery service. We prioritize delivering your orders promptly. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      iconData: Icons.delivery_dining_outlined),
];
