import 'package:flutter/material.dart';

class IntroPageTwo extends StatelessWidget {
  const IntroPageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Psychedelic Swirls.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Center(
                child: Image(
              image: AssetImage(
                'assets/chef-removebg-preview.png',
              ),
              height: 550,
              width: 550,
            ))
          ],
        ),
      ),
    );
  }
}