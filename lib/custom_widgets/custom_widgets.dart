import 'package:flutter/material.dart';

class TestingDecorations extends StatelessWidget {
  final CustomClipper<Path>? clipper;
  final Color color;

  const TestingDecorations(
      {Key? key,  this.clipper, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: clipper,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                // bottomLeft: Radius.circular(70.0),
                bottomRight: Radius.circular(35.0)),
            color: color),
        height: 230,
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 1.3);
    path.quadraticBezierTo(
        size.width / 1.8, size.height, size.width, size.height / 1.3);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }}

