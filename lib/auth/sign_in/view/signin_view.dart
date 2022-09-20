import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pizza_hut/auth/sign_up/view/sign_up.dart';
import 'package:pizza_hut/custom_widgets/custom_textformfield.dart';
import 'package:pizza_hut/custom_widgets/custom_widgets.dart';
import 'package:pizza_hut/first_screen/view/first_screen_view.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  TestingDecorations(
                    color: HexColor('#B0E1E8'),
                    clipper: CurveClipper(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Center(
                      child: Image(
                        image: AssetImage(
                            'assets/signupscreenimage-removebg-preview.png'),
                        height: 300,
                        width: 300,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: CustomTextField(
                  icon: Icons.email,
                  type: TextInputType.emailAddress,
                  labeltext: 'email',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: CustomTextField(
                  icon: Icons.lock,
                  type: TextInputType.name,
                  labeltext: 'password',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot Password ?',style:
                            GoogleFonts.kanit(fontSize: 18, color: Colors.black))
                  ],
                ),
              ),
              SizedBox(height: 30.h,),
              Padding(
                  padding:
                       const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: GestureDetector(
                   onTap: () {
                     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const FirstScreen()),(route) => false,);
                   },
                    child: Container(
                      height: 60.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: HexColor('#1692A8'),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Text(
                        'Sign In',
                        style:
                            GoogleFonts.kanit(fontSize: 22, color: Colors.white),
                      )),
                    ),
                  )),
                  RichText(
                text: TextSpan(
                  text: "Already have an account  ",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: HexColor(
                      '#A89D9D',
                    ),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign up',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const AuthView(),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
