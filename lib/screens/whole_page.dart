import 'package:bakery_website/modals/scroll_offset.dart';
import 'package:bakery_website/screens/section/fifth_section.dart';
import 'package:bakery_website/screens/section/fourth_section.dart';
import 'package:bakery_website/screens/section/second_section.dart';
import 'package:bakery_website/screens/section/sixth_section.dart';
import 'package:bakery_website/screens/section/third_section.dart';
import 'package:flutter/material.dart';
import 'package:bakery_website/screens/section/first_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WholePage extends StatefulWidget {
  const WholePage({super.key});

  @override
  State<WholePage> createState() => _WholePageState();
}

class _WholePageState extends State<WholePage> {
  late ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();

    super.initState();

    controller.addListener(() {
      context.read<DisplayOffset>().changeDisplayOffset(
          (MediaQuery.of(context).size.height + controller.position.pixels)
              .toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        children: [
          FirstSection(),
          SizedBox(
            height: 100.0,
          ),
          SecondSection(),
          SizedBox(
            height: 100.0,
          ),
          ThirdSection(),
          SizedBox(
            height: 100.0,
          ),
          FourthSection(),
          SizedBox(
            height: 100.0,
          ),
          FifthSection(),
          SizedBox(
            height: 100.0,
          ),
          SixthSection(),
        ],
      ),
    );
  }
}
