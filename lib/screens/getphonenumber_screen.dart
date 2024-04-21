import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_newproject/models/CountryModel.dart';
import 'package:flutter_newproject/utils/appFonts.dart';
import 'package:flutter_svg/svg.dart';

import '../components/CustomButton.dart';
import 'enter_otp_screen.dart';

class Phonenumber_screen extends StatefulWidget {
  final CountryModel country;

  const Phonenumber_screen({Key? key, required this.country}) : super(key: key);

  @override
  State<Phonenumber_screen> createState() => _Phonenumber_screenState();
}

class _Phonenumber_screenState extends State<Phonenumber_screen> {
  final TextEditingController _phoneNumberController = TextEditingController();

  Future<void> _getOtp() async {
    final String telCode = widget.country.telCode;
    final String phoneNumber = _phoneNumberController.text;
    
    final response = await http.post(
      Uri.parse('https://studylancer.yuktidea.com/api/student/login'),
      headers: <String, String>{
        'Accept': 'application/json',
      },
      body: <String, String>{
        'tel_code': telCode,
        'phone': phoneNumber,
      },
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, navigate to the OTP screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Enterotp_screen(

          telCode: widget.country.telCode,
          phoneNumber: _phoneNumberController.text,
        )),
      );
    } else {
      // If the server returns an error response, display a message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to get OTP. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF292929), // Background color
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text('Enter Phone Number', style: font24white),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Please enter your 10 digit mobile \n number to receive OTP....",
                        textAlign: TextAlign.center,
                        style: font14lightorange,
                      ),
                    ],
                  ),
                  SizedBox(height: 18), // Add spacing
                  PhoneField(context),
                  SizedBox(height: 350,),
                  CustomButton(
                    text: "Get OTP",
                    onPressed: _getOtp, // Call _getOtp function when button is pressed
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Center PhoneField(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.white))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: SvgPicture.network(
                widget.country.flag,
                width: 15,
                height: 15,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              widget.country.telCode,
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 120,
              child: TextFormField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                style: TextStyle(color: Colors.white),
                maxLength: 10,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "9999999999",
                    counterText: "",
                    hintStyle: TextStyle(
                        color: Color.fromARGB(87, 255, 255, 255),
                        fontWeight: FontWeight.w300)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
