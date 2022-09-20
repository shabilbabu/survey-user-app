
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pizza_hut/auth/sign_in/view/signin_view.dart';
import 'package:pizza_hut/auth/sign_up/view/sign_up.dart';
import 'package:pizza_hut/first_screen/view/first_screen_view.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../provider/intro_provider.dart';
import 'intro_1.dart';
import 'intro_2.dart';
import 'intro_3.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: ((index) {
              Provider.of<IntroductionController>(context, listen: false)
                  .boolianUpdate(index);
            }),
            controller: Provider.of<IntroductionController>(context).controller,
            children: const [
              IntroPageOne(),
              IntroPageTwo(),
              IntroPageThree(),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            alignment: const Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  effect: ExpandingDotsEffect(
                    spacing: 10,
                    radius: 5,
                    dotWidth: 20,
                    dotHeight: 12,
                    dotColor: HexColor("#E3E3E3"),
                    activeDotColor: HexColor('#34444C'),
                  ),
                  controller: Provider.of<IntroductionController>(context,
                          listen: false)
                      .controller,
                  count: 3,
                ),
                Provider.of<IntroductionController>(context).onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SignInView()),(route) => false,);
                        },
                        child: Container(
                          height: 40.h,
                          width: 120.h,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child:   Center(child: Text('Get started',style: GoogleFonts.kanit(color: Colors.white,))),
                        )
                      )
                    : GestureDetector(
                        onTap: () {
                          Provider.of<IntroductionController>(context,
                                  listen: false)
                              .controller
                              .nextPage(
                                duration: const Duration(
                                  milliseconds: 500,
                                ),
                                curve: Curves.easeIn,
                              );
                        },
                        child: Container(
                          height: ScreenUtil().setHeight(30),
                          width: ScreenUtil().setWidth(120),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
