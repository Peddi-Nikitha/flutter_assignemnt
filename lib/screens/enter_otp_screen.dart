import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_newproject/screens/select_country_screen.dart';
import 'package:http/http.dart' as http;

import '../components/CustomButton.dart';

class Enterotp_screen extends StatefulWidget {
  final String telCode;
  final String phoneNumber;

  const Enterotp_screen({
    Key? key,
    required this.telCode,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<Enterotp_screen> createState() => _Enterotp_screenState();
}

class _Enterotp_screenState extends State<Enterotp_screen> {
  TextEditingController controller = TextEditingController();
  late Timer _timer;
  int _secondsRemaining = 0;

  Future<void> _verifyOtp() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => country_screen()),
    );

    final response = await http.post(
      Uri.parse('https://studylancer.yuktidea.com/api/verify-otp'),
      headers: <String, String>{
        'Accept': 'application/json',
      },
      body: <String, String>{
        'code': controller.text,
        'phone': widget.phoneNumber,
      },
    );

    if (response.statusCode == 200) {
      // Handle successful OTP verification
      // For example, navigate to the next screen
      // Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));
    } else {
      // Handle OTP verification failure
      // Display an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to verify OTP. Please try again.')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (timer) {
        if (_secondsRemaining == 0) {
          _timer.cancel();
        } else {
          setState(() {
            _secondsRemaining--;
          });
        }
      },
    );
  }

  void resendOtp() {
    // Implement your logic to resend OTP here
    // For example, you can make another API call to resend OTP
    // Reset timer and start again
    _secondsRemaining = 30;
    startTimer();
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
                    child: Text(
                      'Verify Number',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Please enter the OTP received to\n verify your number",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.orange, fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(),
                  ),
                  SizedBox(height: 150),
                  Center(
                      child: Text("Didn’t receive OTP?",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(101, 255, 255, 255)))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _secondsRemaining == 0
                          ? TextButton(
                              onPressed: resendOtp,
                              child: Text(
                                'Resend OTP',
                                style: TextStyle(color: Colors.orange),
                              ),
                            )
                          : Text('Resend OTP in $_secondsRemaining seconds',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(101, 255, 255, 255)))
                    ],
                  ),
                  SizedBox(height: 150),
                  CustomButton(
                    onPressed: _verifyOtp,
                    text: 'Verify OTP',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
