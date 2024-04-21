import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_newproject/components/CustomButton.dart';
import 'package:flutter_newproject/utils/appFonts.dart';
import 'package:flutter_svg/svg.dart';

class country_screen extends StatefulWidget {
  @override
  State<country_screen> createState() => _country_screenState();
}

class _country_screenState extends State<country_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              color: Color(0xFF292929), // Background color
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFF292929),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFBDBDBD).withOpacity(0.3),
                                offset: Offset(-4, -3),
                                blurRadius: 10,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Select Country',
                      style: font24white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Please select a country where\n you want to study",
                      textAlign: TextAlign.center,
                      style: font14lightorange,
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 120,
                            width: 120,
                            child: SvgPicture.asset("assets/images/Australia.svg")),
                            Text("Australia", style: TextStyle(color: Colors.white, fontSize: 25),)
                        ],
                      ),
                        Column(
                        children: [
                          SizedBox(
                            height: 120,
                            width: 120,
                            child: SvgPicture.asset("assets/images/Canada.svg")),
                            Text("Canada", style: TextStyle(color: Colors.white, fontSize: 25),)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  CustomButton(
                    text: "Proceed...",
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
