import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/text_reveal.dart';

class FirstSection extends StatefulWidget {
  const FirstSection({super.key});

  @override
  State<FirstSection> createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> textRevealAnimation;
  late Animation<double> textOpacityAnimation;
  late Animation<double> descriptionAnimation;
  late Animation<double> smallImageReveal;
  late Animation<double> smallImageOpacity;
  late Animation<double> navBarOpacity;

  @override
  // Did not add bloc widget to detect scroll in first section
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1700),
      reverseDuration: const Duration(milliseconds: 375),
    );

    textRevealAnimation = Tween<double>(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.3, curve: Curves.easeOut)));

    textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.3, curve: Curves.easeOut)));

    descriptionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.3, 0.5, curve: Curves.easeOut)));

    smallImageReveal = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 0.7, curve: Curves.easeOut)));

    smallImageOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 0.8, curve: Curves.easeOut)));

    navBarOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.8, 1.0, curve: Curves.easeOut)));

    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 100),
      height: 920.0,
      child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Image.network(
                                'https://i.imgur.com/FJTJwdV.png',
                                fit: BoxFit.cover,
                                width: 120.0,
                              ),
                            ),
                            Container(
                              height: 120.0,
                              width: smallImageReveal.value,
                              color: Colors.white,
                            )
                          ],
                        ),
                        FadeTransition(
                          opacity: textOpacityAnimation,
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Text(
                              'Whimsical Bites',
                              style: GoogleFonts.montserrat(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextReveal(
                            maxHeight: 90.0,
                            controller: controller,
                            textOpacityAnimation: textOpacityAnimation,
                            textRevealAnimation: textRevealAnimation,
                            child: Text(
                              'Welcome to',
                              style: GoogleFonts.quicksand(
                                fontSize: 65.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          TextReveal(
                            maxHeight: 90.0,
                            controller: controller,
                            textOpacityAnimation: textOpacityAnimation,
                            textRevealAnimation: textRevealAnimation,
                            child: Text(
                              'Whimsical Bites',
                              style: GoogleFonts.quicksand(
                                fontSize: 65.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          FadeTransition(
                            opacity: descriptionAnimation,
                            child: Text(
                              'Indulge in culinary whimsy at \'Whimsical Bites\'—where each dish is a playful masterpiece, and every bite is a thrill. Our vibrant flavors and joyful ambiance make dining a delightful adventure. Join us for a whimsical journey through taste!',
                              style: GoogleFonts.quicksand(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),
                          FadeTransition(
                            opacity: descriptionAnimation,
                            child: Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 15.0,
                                    color: Colors.black12,
                                  ),
                                ],
                              ),
                              child: SizeTransition(
                                sizeFactor: descriptionAnimation,
                                axis: Axis.horizontal,
                                child: Row(
                                  children: [
                                    const Flexible(
                                      child: TextField(
                                        decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            contentPadding:
                                                EdgeInsets.all(12.0),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius: BorderRadius.zero,
                                            )),
                                      ),
                                    ),
                                    Container(
                                      height: 49.0,
                                      width: 49.0,
                                      color: Colors.red,
                                      child: const Icon(Icons.search),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),
                          Flexible(
                              child: Row(
                            children: [
                              SizedBox(
                                height: 120.0,
                                width: 180.0,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(1.0),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1578775887804-699de7086ff9?q=80&w=1035&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                        fit: BoxFit.cover,
                                        width: 180.0,
                                      ),
                                    ),
                                    Container(
                                      height: 120.0,
                                      width: smallImageReveal.value,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Flexible(
                                  child: FadeTransition(
                                opacity: smallImageOpacity,
                                child: Text(
                                  'Indulge your taste buds with our irresistible cheesecake that melts in your mouth. Don\'t miss out on the cheesecake experience!',
                                  style: GoogleFonts.quicksand(
                                    fontSize: 16.0,
                                    height: 1.5,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ))
                            ],
                          ))
                        ],
                      ),
                    ))
                  ],
                )),
                const SizedBox(
                  width: 150.0,
                ),
                const Expanded(child: FirstPageImage()),
                SizedBox(
                  width: 100.0,
                  height: 500.0,
                  child: FadeTransition(
                    opacity: navBarOpacity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 80.0,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.menu),
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: ['Home', 'About', 'Offers', 'Accounts']
                              .map<Widget>((title) {
                            return RotatedBox(
                              quarterTurns: 1,
                              child: Text(title,
                                  style: GoogleFonts.quicksand(fontSize: 14.0)),
                            );
                          }).toList(),
                        ))
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}

class FirstPageImage extends StatefulWidget {
  const FirstPageImage({super.key});

  @override
  State<FirstPageImage> createState() => _FirstPageImageState();
}

class _FirstPageImageState extends State<FirstPageImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = Tween<double>(begin: 920.0, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(
        'https://images.unsplash.com/photo-1620980776848-84ac10194945?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        fit: BoxFit.cover, loadingBuilder: (context, child, loadingProgress) {
      if (loadingProgress == null) {
        Future.delayed(const Duration(milliseconds: 500), () {
          if (_controller.isDismissed) {
            _controller.forward();
          }
        });
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
                  height: 920.0,
                  width: double.infinity,
                  child: child,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: _animation.value,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                )
              ],
            );
          },
          child: child,
        );
      }
      return const SizedBox();
    });
  }
}
