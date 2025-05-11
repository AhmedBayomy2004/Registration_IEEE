import 'package:flutter/material.dart';
import 'package:registration_ieee/const/const_color.dart';

import 'layout.dart';

class LogoPage extends StatelessWidget {
  const LogoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 70),
            Image.asset(
              'assets/logo.png',
              color: AppColors.primary,
              width: 230,
              height: 230,
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: Center(
                child: Column(children: [
                  SizedBox(height: 10),
                  Divider(
                    color: AppColors.success,
                    thickness: 3,
                    indent: 130,
                    endIndent: 130,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 30,
                      color: AppColors.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Go and enjoy our features for free and',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: AppColors.secondary,
                    ),
                  ),
                  Text(
                    'make your life easy with us',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondary,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Layout()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: 15),
                          Text(
                            'Lets Go',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.black,
                            ),
                          ),
                          Icon(Icons.arrow_forward,
                              size: 2, color: AppColors.black),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
