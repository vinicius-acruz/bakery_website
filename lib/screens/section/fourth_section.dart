import 'package:bakery_website/widgets/text_reveal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../modals/scroll_offset.dart';

class FourthSection extends StatefulWidget {
  const FourthSection({super.key});

  @override
  State<FourthSection> createState() => _FourthSectionState();
}

class _FourthSectionState extends State<FourthSection>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> imageRevealAnimation;
  late Animation<double> textRevealAnimation;
  late Animation<double> subTextOpacityAnimation;
  late Animation<double> subImageRevealAnimation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1700),
        reverseDuration: const Duration(milliseconds: 375));
    imageRevealAnimation = Tween(begin: 500.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.40, curve: Curves.easeOut)));
    textRevealAnimation = Tween(begin: 70.0, end: 0.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.3, 0.6, curve: Curves.easeOut)));

    subTextOpacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 0.8, curve: Curves.easeOut)));

    subImageRevealAnimation = Tween(begin: 0.0, end: 90.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.70, 1, curve: Curves.easeOut)));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayOffset, ScrollOffset>(
      //buildWhen will refresh the widget only when its on visible area
      buildWhen: (previous, current) {
        if (current.scrollOffsetValue >= 2800) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        state.scrollOffsetValue > 2900
            ? controller.forward()
            : controller.reverse(); //Detect scroll only on section 2
        return SizedBox(
          height: 500.0,
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Flexible(
                child: Stack(
                  children: [
                    Container(
                      width: 400.0,
                      padding: const EdgeInsets.all(1.0),
                      child: Image.network(
                          'https://images.unsplash.com/photo-1586775202188-6cea015a4b1d?q=80&w=1035&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                          fit: BoxFit.cover),
                    ),
                    AnimatedBuilder(
                        animation: imageRevealAnimation,
                        builder: (context, child) {
                          return Container(
                            height: imageRevealAnimation.value,
                            width: double.infinity,
                            color: Colors.white,
                            alignment: const Alignment(0.0, -1.0),
                          );
                        }),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              AnimatedBuilder(
                  animation: textRevealAnimation,
                  builder: (context, child) {
                    return Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextReveal(
                            maxHeight: 55,
                            controller: controller,
                            child: Text(
                              'Order Your',
                              style: GoogleFonts.quicksand(
                                  fontSize: 45.0, fontWeight: FontWeight.w700),
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          TextReveal(
                            maxHeight: 55,
                            controller: controller,
                            child: Text('Favorite Food',
                                style: GoogleFonts.quicksand(
                                    fontSize: 45.0,
                                    fontWeight: FontWeight.w700)),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          AnimatedBuilder(
                              animation: subTextOpacityAnimation,
                              builder: (context, child) {
                                return FadeTransition(
                                  opacity: subTextOpacityAnimation,
                                  child: Text(
                                      'Indulge in our exquisite brunch menu that promises a delightful fusion of flavors and freshness. From savory classics to delectable pastries, our brunch will elevate your morning to a culinary experience like no other.',
                                      style: GoogleFonts.quicksand(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      )),
                                );
                              }),
                          const SizedBox(
                            height: 20.0,
                          ),
                          AnimatedBuilder(
                              animation: subTextOpacityAnimation,
                              builder: (context, child) {
                                return FadeTransition(
                                  opacity: subTextOpacityAnimation,
                                  child: Text(
                                      'Satisfy your sweet cravings with our exquisite desserts that are a treat for your taste buds. Our skilled pastry chefs craft each dessert with precision and passion, ensuring a delightful and indulgent experience with every bite.',
                                      style: GoogleFonts.quicksand(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      )),
                                );
                              }),
                          const SizedBox(
                            height: 50.0,
                          ),
                          Container(
                            height: 100.0,
                            alignment: const Alignment(0.0, -1.0),
                            child: AnimatedBuilder(
                                animation: subImageRevealAnimation,
                                builder: (context, child) {
                                  return SizedBox(
                                    height: subImageRevealAnimation.value,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Image.network(
                                            'https://images.unsplash.com/photo-1467453678174-768ec283a940?q=80&w=1144&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20.0,
                                        ),
                                        Expanded(
                                          child: Image.network(
                                            'https://images.unsplash.com/photo-1533089860892-a7c6f0a88666?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    );
                  }),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              )
            ],
          ),
        );
      },
    );
  }
}
