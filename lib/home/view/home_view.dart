import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Image(
                image: const AssetImage('assets/Psychedelic Swirls.jpeg'),
                fit: BoxFit.cover,
                height: 600.h,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 480.h,
                width: 280.w,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/boy-removebg-preview.png'))),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Container(
                  height: 220.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: Column(
                      children: [
                        Text(
                          'Fill out the Pre - Anesthesia Questionnaire',
                          style: GoogleFonts.kanit(fontSize: 22),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: HexColor('#76C3CA'),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                            'Start',
                            style: GoogleFonts.kanit(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
