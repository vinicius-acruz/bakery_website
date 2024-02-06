import 'package:bakery_website/modals/infos.dart';
import 'package:bakery_website/widgets/info_card.dart';
import 'package:bakery_website/widgets/text_reveal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../modals/scroll_offset.dart';

class ThirdSection extends StatefulWidget {
  const ThirdSection({super.key});

  @override
  State<ThirdSection> createState() => _ThirdSectionState();
}

class _ThirdSectionState extends State<ThirdSection>
    with TickerProviderStateMixin {
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
    return Container(
      height: 510.0,
      color: const Color(0xFFBE133C).withOpacity(0.1),
      child: Column(
        children: [
          const SizedBox(
            height: 50.0,
          ),
          BlocBuilder<DisplayOffset, ScrollOffset>(
            //buildWhen will refresh the widget only when its on visible area
            buildWhen: (previous, current) {
              if ((current.scrollOffsetValue >= 1900 &&
                      current.scrollOffsetValue <= 2300) ||
                  controller.isAnimating) {
                return true;
              } else {
                return false;
              }
            },
            builder: (context, state) {
              state.scrollOffsetValue > 2100
                  ? controller.forward()
                  : controller.reverse(); //Detect scroll only on this section
              return TextReveal(
                  maxHeight: 55,
                  controller: controller,
                  child: Text(
                    'How it works!',
                    style: GoogleFonts.quicksand(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ));
            },
          ),
          const SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: infos
                .map<Widget>((info) => InfoCard(
                      info: info,
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
