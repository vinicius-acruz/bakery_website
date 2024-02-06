import 'package:bakery_website/modals/items.dart';
import 'package:bakery_website/modals/scroll_offset.dart';
import 'package:bakery_website/widgets/text_reveal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/item_card.dart';

class SecondSection extends StatefulWidget {
  SecondSection({super.key});

  @override
  State<SecondSection> createState() => _SecondSectionState();
}

class _SecondSectionState extends State<SecondSection>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
        reverseDuration: const Duration(milliseconds: 375));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<DisplayOffset, ScrollOffset>(
          //buildWhen will refresh the widget only when its on visible area
          buildWhen: (previous, current) {
            if ((current.scrollOffsetValue >= 1200 &&
                    current.scrollOffsetValue <= 1700) ||
                controller.isAnimating) {
              return true;
            } else {
              return false;
            }
          },
          builder: (context, state) {
            state.scrollOffsetValue > 1400
                ? controller.forward()
                : controller.reverse(); //Detect scroll only on this section
            return TextReveal(
                maxHeight: 75,
                controller: controller,
                child: Text(
                  'Dish of the Day',
                  style: GoogleFonts.quicksand(
                    fontSize: 55.0,
                    fontWeight: FontWeight.w700,
                  ),
                ));
          },
        ),
        const SizedBox(
          height: 100.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 8.0),
          child: Center(
            child: Wrap(
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 80.0,
              spacing: 80.0,
              children: items.map<Widget>((item) {
                return ItemCard(
                  image: item.image,
                  title: item.title,
                  subtitle: item.subtitle,
                  description: item.description,
                  price: item.price,
                  index: items.indexOf(item),
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(
          height: 80.0,
        ),
        Container(
          height: 60.0,
          width: 150.0,
          child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFBE133C),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0))),
              onPressed: () {},
              child: Text(
                'View More',
                style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                    color: Colors.white),
              )),
        ),
      ],
    );
  }
}
