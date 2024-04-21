import 'package:flutter/material.dart';
import 'package:flutter_newproject/utils/appFonts.dart';

class NeumorphicCancelButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NeumorphicCancelButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 return GestureDetector(
  onTap: () {
    Navigator.of(context).pop();
  },
      
      child: Container(
        width: 40,
        height: 40,
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
            // BoxShadow(
            //   color: Color(0xFF000000).withOpacity(0.36),
            //   offset: Offset(8, 5),
            //   blurRadius: 10,
            //   spreadRadius: 0,
            // ),
          ],
        ),
        child: Icon(
          Icons.close,
          color: Colors.white,

        ),
      ),
    );
  }
}

class Term_condtion_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF292929),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color(0xFF292929),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  NeumorphicCancelButton(
                    onPressed: () {
                      // Add functionality for cancel button
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    // First image
                    Positioned(
                      bottom: 12,
                      right: 9,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Image.asset(
                          'assets/images/term1.png',
                          height: 100,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Second image
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/images/term2.png',
                        height: 100,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Terms of Conditions',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFD9896A),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Update 12/09/2023',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff7D7E80),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Privacy Policy',
              style: font14lightorange
            ),
            SizedBox(height: 10),
            Text(
              'At studylancer, accessible from studylancer.com, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by studylancer and how we use it. If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us. This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in studylancer. This policy is not applicable to any information collected offline or via channels other than this website.',
              style: font12white
            ),
            SizedBox(height: 10),
            Text(
              'Content',
              style:font14lightorange
            ),
            SizedBox(height: 10),
            Text(
              'By using our website, you hereby consent to our Privacy Policy and agree to its terms.',
              style: font12white
            ),
            SizedBox(height: 10),
            Text(
              'Information we collect',
              style: font14lightorange
            ),
            SizedBox(height: 10),
            Text(
              'The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information. If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you may send us, and any other information you may choose to provide. When you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.',
              style: font12white
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
