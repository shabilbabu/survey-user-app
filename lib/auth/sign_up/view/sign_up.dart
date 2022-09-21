import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pizza_hut/auth/sign_in/view/signin_view.dart';
import 'package:pizza_hut/auth/sign_up/provider/sign_up_provider.dart';
import 'package:pizza_hut/custom_widgets/custom_textformfield.dart';
import 'package:provider/provider.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('#152238'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 110),
            child: Column(
              children: [
                Text(
                  'Hello',
                  style: GoogleFonts.lobster(
                    fontSize: 60,
                    color: Colors.orange,
                  ),
                ),
                Text(
                  'Please Sign Up your Account',
                  style: GoogleFonts.lobster(
                    fontSize: 20,
                    color: Colors.orange,
                  ),
                ),
                SizedBox(
                  height: 40.h,
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
                      hinttext: 'username',
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
                  child: Form(
                    key: context.read<SignUpProvider>().emailFormKey,
                    child: CustomTextField(
                      controller:
                          context.watch<SignUpProvider>().emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return 'Enter a valid email Address';
                        }
                        return null;
                      },
                      icon: Icons.email,
                      type: TextInputType.emailAddress,
                      hinttext: 'email',
                      onChanged: (value) => context
                          .read<SignUpProvider>()
                          .emailFormKey
                          .currentState!
                          .validate(),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Form(
                    key: context.read<SignUpProvider>().passwordFormKey,
                    child: CustomTextField(
                      controller:
                          context.watch<SignUpProvider>().passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        } else if (!RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{7,}$')
                            .hasMatch(value)) {
                          return 'Password is 1 UpperCase Alphabet and 1 Special Character and Numeric';
                        }
                        return null;
                      },
                      icon: Icons.lock,
                      type: TextInputType.name,
                      hinttext: 'password',
                      onChanged: (value) => context
                          .read<SignUpProvider>()
                          .passwordFormKey
                          .currentState!
                          .validate(),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Form(
                    key: context.read<SignUpProvider>().confirmPasswordFormkey,
                    child: CustomTextField(
                      controller: context
                          .watch<SignUpProvider>()
                          .confirmPasswordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        } else if (context
                                .read<SignUpProvider>()
                                .passwordController
                                .text
                                .trim() !=
                            context
                                .read<SignUpProvider>()
                                .confirmPasswordController
                                .text
                                .trim()) {
                          return 'Enter a valid password';
                        }
                        return null;
                      },
                      icon: Icons.verified,
                      type: TextInputType.name,
                      hinttext: 'confirm password',
                      onChanged: (value) => context
                          .read<SignUpProvider>()
                          .confirmPasswordFormkey
                          .currentState!
                          .validate(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: GestureDetector(
                      onTap: () {
                        context.read<SignUpProvider>().validate(context);
                      },
                      child: Container(
                        height: 60.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(child: Consumer<SignUpProvider>(
                          builder: (context, value, child) {
                            return value.isLoading == true
                                ? const Center(child: CircularProgressIndicator())
                                : Text(
                                    'Sign Up',
                                    style: GoogleFonts.kanit(
                                        fontSize: 22, color: Colors.white),
                                  );
                          },
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
                            color: Colors.orange,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const SignInView()),
                                (route) => false,
                              );
                            }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
