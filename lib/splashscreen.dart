
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
              child: SvgPicture.asset("assets/images/logo_icon.svg",width: 200,height: 200),

    );
  }
}
