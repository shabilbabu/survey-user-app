import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class IntroPageTwo extends StatelessWidget {
  const IntroPageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#152238'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
            ),
            Text(
              'Just answer the questions . . .',
              style: GoogleFonts.lobster(
                fontSize: 40,
                color: Colors.orange,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Container(
              height: 500.h,
              width: 500.w,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  'assets/chef-removebg-preview.png',
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
