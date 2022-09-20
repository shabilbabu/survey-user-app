import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pizza_hut/auth/sign_in/view/signin_view.dart';
import 'package:pizza_hut/auth/sign_up/provider/sign_up_provider.dart';
import 'package:pizza_hut/custom_widgets/custom_textformfield.dart';
import 'package:pizza_hut/custom_widgets/custom_widgets.dart';
import 'package:pizza_hut/first_screen/view/first_screen_view.dart';
import 'package:provider/provider.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Form(
                  key: context.read<SignUpProvider>().usernameFormkey,
                  child: CustomTextField(
                    controller:
                        context.watch<SignUpProvider>().usernameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Field is required';
                          } else if (value.length < 4) {
                            return 'Username should be 4 digit';
                          }
                          return null;
                        },
                    icon: Icons.person,
                    type: TextInputType.name,
                    labeltext: 'username',
                    onChanged: (value) => context
                        .read<SignUpProvider>()
                        .usernameFormkey
                        .currentState!
                        .validate(),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: CustomTextField(
                  controller: context.watch<SignUpProvider>().emailController,
                  icon: Icons.email,
                  type: TextInputType.emailAddress,
                  labeltext: 'email',
                  onChanged: (value) => context
                      .read<SignUpProvider>()
                      .emailFormKey
                      .currentState!
                      .validate(),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: CustomTextField(
                  controller:
                      context.watch<SignUpProvider>().passwordController,
                  icon: Icons.lock,
                  type: TextInputType.name,
                  labeltext: 'password',
                  onChanged: (value) => context
                      .read<SignUpProvider>()
                      .passwordFormKey
                      .currentState!
                      .validate(),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: CustomTextField(
                  controller:
                      context.watch<SignUpProvider>().confirmPasswordController,
                  icon: Icons.verified,
                  type: TextInputType.name,
                  labeltext: 'confirm password',
                  onChanged: (value) => context
                      .read<SignUpProvider>()
                      .confirmPasswordFormkey
                      .currentState!
                      .validate(),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: GestureDetector(
                    onTap: () {
                      context.read<SignUpProvider>().validate(context);
                    },
                    child: Container(
                      height: 60.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: HexColor('#1692A8'),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Text(
                        'Sign Up',
                        style: GoogleFonts.kanit(
                            fontSize: 22, color: Colors.white),
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
                      text: 'Sign in',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SignInView(),
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
