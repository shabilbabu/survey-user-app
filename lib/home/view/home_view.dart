import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pizza_hut/Questions_screen/view/question_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('#152238'),
        body: Stack(
          children: [

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
                      color: Colors.orange,
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
                        GestureDetector(
                          onTap:() =>  Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuestionView())),
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: HexColor('#152238'),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              'Start',
                              style: GoogleFonts.kanit(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            )),
                          ),
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
