import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_newproject/screens/getcountry_screen.dart';
import 'package:flutter_newproject/screens/select_country_screen.dart';
import 'package:flutter_newproject/screens/trems&condition_screen.dart';


class StartupScreen extends StatefulWidget {
  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/startup.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 270,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF292929),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Welcome to Study Lancer',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    'Please select your role to get registered',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CountrySelectionScreen()));
                        },
                        child: CustomShadowContainer(
                          backgroundImage:
                              AssetImage('assets/images/student.png'),
                          child: Container(
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CountrySelectionScreen()));
                        },
                        child: CustomShadowContainer(
                          backgroundImage:
                              AssetImage('assets/images/agent.png'),
                          child: Container(
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Student",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                      SizedBox(width: 20),
                      Text("Agent", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      children: [
                        TextSpan(text: 'By continuing you agree to our '),
                        TextSpan(
                          text: 'Terms and Conditions',
                          style: TextStyle(color: Color(0xFFD9896A)),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Term_condtion_screen()));
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomShadowContainer extends StatelessWidget {
  final Widget child;
  final ImageProvider backgroundImage;

  const CustomShadowContainer({
    Key? key,
    required this.child,
    required this.backgroundImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: backgroundImage,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color.fromARGB(255, 23, 22, 22), width: 8),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            spreadRadius: 4,
            blurRadius: 4,
            offset: Offset(-4, -4),
          ),
        ],
      ),
      child: child,
    );
  }
}
