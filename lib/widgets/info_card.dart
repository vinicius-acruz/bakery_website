import 'package:bakery_website/modals/infos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../modals/scroll_offset.dart';

class InfoCard extends StatefulWidget {
  final Info info;

  const InfoCard({super.key, required this.info});

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayOffset, ScrollOffset>(
      //buildWhen will refresh the widget only when its on visible area
      buildWhen: (previous, current) {
        if (current.scrollOffsetValue >= 2200) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        return AnimatedCrossFade(
          crossFadeState: state.scrollOffsetValue >= 2400
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 575),
          reverseDuration: const Duration(milliseconds: 375),
          alignment: Alignment.center,
          firstCurve: Curves.easeOut,
          secondCurve: Curves.easeOut,
          firstChild: Container(
            height: 260.0,
            width: 220.0,
            margin: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 5.0),
          ),
          secondChild: Container(
            margin: const EdgeInsets.all(25.0),
            height: 260.0,
            width: 220.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                        color: Color(0xFFBE133C),
                        borderRadius: BorderRadius.circular(100)),
                    child: Icon(
                      widget.info.iconData,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    widget.info.title,
                    style: GoogleFonts.quicksand(
                        fontSize: 20.0, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    widget.info.description,
                    style: GoogleFonts.quicksand(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black38),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
