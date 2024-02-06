import 'package:bakery_website/modals/chefs.dart';
import 'package:bakery_website/widgets/chef_card.dart';
import 'package:bakery_website/widgets/text_reveal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../modals/scroll_offset.dart';

class FifthSection extends StatefulWidget {
  const FifthSection({super.key});

  @override
  State<FifthSection> createState() => _FifthSectionState();
}

class _FifthSectionState extends State<FifthSection>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
        reverseDuration: const Duration(milliseconds: 375));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<DisplayOffset, ScrollOffset>(
          //buildWhen will refresh the widget only when its on visible area
          buildWhen: (previous, current) {
            if (current.scrollOffsetValue >= 3000) {
              return true;
            } else {
              return false;
            }
          },
          builder: (context, state) {
            state.scrollOffsetValue > 3100
                ? controller.forward()
                : controller.reverse(); //Detect scroll only on section 2
            return TextReveal(
              maxHeight: 55.0,
              controller: controller,
              child: Text(
                'Most Expert Chefs',
                style: GoogleFonts.quicksand(
                    fontSize: 40.0, fontWeight: FontWeight.w700),
              ),
            );
          },
        ),
        const SizedBox(
          height: 50.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: chefs
              .map((chef) => ChefCard(
                    chef: chef,
                  ))
              .toList(),
        )
      ],
    );
  }
}
