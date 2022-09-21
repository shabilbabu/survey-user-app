import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pizza_hut/home/view/home_view.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('#152238'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 200.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      // image: DecorationImage(
                      //   image: AssetImage('assets/Psychedelic Swirls.jpeg'),
                      //   fit: BoxFit.cover,
                      // ),
                      color: Colors.orange
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 60,
                    ),
                    child: Container(
                      height: 250.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            children: [
                              const Image(
                                image: AssetImage(
                                    'assets/serveyillustration-removebg-preview.png'),
                                height: 200,
                                width: 200,
                              ),
                              Text(
                                'Select your topic for servey...',
                                style: GoogleFonts.kanit(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 500,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomeView(),
                          ),
                        ),
                        child: Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: Colors.white, width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text((index+1).toString(),style: GoogleFonts.kanit(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),),
                                  SizedBox(width: 130.w,),
                                Text(
                                  'Food',
                                  style: GoogleFonts.kanit(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
