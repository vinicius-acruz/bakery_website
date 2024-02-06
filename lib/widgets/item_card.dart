import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../modals/scroll_offset.dart';

class ItemCard extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final String description;
  final String price;
  final int index;

  const ItemCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.price,
    required this.index,
  });

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> imageReveal;
  late Animation<double> imageOpacity;
  late Animation<double> headingTextOpacity;
  late Animation<double> subTextOpacity;
  late Animation<double> descriptionOpacity;
  late Animation<double> priceOpacity;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
      reverseDuration: const Duration(milliseconds: 500),
    );

    imageReveal = Tween<double>(begin: 0.0, end: 170.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut)));

    imageOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut)));

    headingTextOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.3, 0.5, curve: Curves.easeOut)));

    subTextOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.4, 0.6, curve: Curves.easeOut)));

    descriptionOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 0.8, curve: Curves.easeOut)));
    priceOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.8, 1.0, curve: Curves.easeOut)));

    super.initState();

    Future.delayed(const Duration(milliseconds: 1000), () {
      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayOffset, ScrollOffset>(
      //buildWhen will refresh the widget only when its on visible area
      buildWhen: (previous, current) {
        if ((current.scrollOffsetValue >= 1000 &&
                current.scrollOffsetValue <= 1950) ||
            controller.isAnimating) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        state.scrollOffsetValue >= (1100 + widget.index * 100)
            ? controller.forward()
            : controller.reverse(); //Detect scroll only on section 2
        return Container(
          height: 180.0,
          width: 580.0,
          child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Row(
                  children: [
                    SizedBox(
                      height: 180.0,
                      width: 180.0,
                      child: Center(
                        child: FadeTransition(
                          opacity: imageOpacity,
                          child: SizedBox(
                            height: imageReveal.value,
                            width: imageReveal.value,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                widget.image,
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.medium,
                                scale: 0.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FadeTransition(
                            opacity: headingTextOpacity,
                            child: Text(
                              widget.title,
                              style: GoogleFonts.quicksand(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          FadeTransition(
                            opacity: subTextOpacity,
                            child: Text(
                              widget.subtitle,
                              style: GoogleFonts.quicksand(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black38,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          FadeTransition(
                            opacity: descriptionOpacity,
                            child: Text(
                              widget.description,
                              style: GoogleFonts.quicksand(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          FadeTransition(
                            opacity: priceOpacity,
                            child: Text(
                              widget.price,
                              style: GoogleFonts.quicksand(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFFBE133C),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                );
              }),
        );
      },
    );
  }
}
