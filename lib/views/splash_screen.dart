import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:registration_ieee/views/logo_page.dart';

import '../const/const_color.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 4),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LogoPage()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext c) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Animate(
                effects: [
                  FadeEffect(),
                  ScaleEffect(),
                  RotateEffect(),
                ],
                child: Image.asset(
                  'assets/qr.png',
                  width: 230,
                  height: 230,
                ),
              ),
              const SizedBox(height: 50),
              Animate(
                effects: [
                  FadeEffect(),
                  ScaleEffect(),
                  RotateEffect(),
                ],
                child: Text(
                  "Event Registration",
                  style: TextStyle(
                    fontSize: 30,
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
