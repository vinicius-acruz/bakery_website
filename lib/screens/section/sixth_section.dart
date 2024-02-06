import 'package:bakery_website/modals/footer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bakery_website/widgets/footer_link.dart';

class SixthSection extends StatefulWidget {
  const SixthSection({super.key});

  @override
  State<SixthSection> createState() => _SixthSectionState();
}

class _SixthSectionState extends State<SixthSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      color: const Color(0xFFBE133C).withOpacity(0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: footer
                .map((footer) => FooterLink(
                      footer: footer,
                    ))
                .toList(),
          )),
          Container(
            margin: const EdgeInsets.only(left: 50.0, right: 80.0),
            height: 200.0,
            width: 250.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Subscribe Now',
                  style: GoogleFonts.quicksand(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.person_outline_rounded,
                      color: Colors.black,
                    ),
                    hintText: 'Your E-mail',
                    hintStyle: GoogleFonts.quicksand(
                        color: Colors.black45, fontWeight: FontWeight.w700),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                        borderSide: const BorderSide(
                            color: Colors.black26, width: 1.5)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                        borderSide: const BorderSide(
                            color: Colors.black26, width: 1.5)),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 50.0,
                  width: 250.0,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFBE133C),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0))),
                      onPressed: () {},
                      child: Text(
                        'Subscribe Now',
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w600, color: Colors.white),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
