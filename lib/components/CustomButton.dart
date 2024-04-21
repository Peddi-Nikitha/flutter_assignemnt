import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF212426), // Button color
            Color(0xFF212426), // Button color
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF121214), // Dark shadow color
            offset: Offset(4, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0xFF35373B),
            offset: Offset(-6, -6),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
        border: Border.all(
          color: Color.fromARGB(20, 255, 255, 255),
          width: 1.5,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF292929),
          elevation: 0.4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
          ),
          child: Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(minWidth: 20, minHeight: 60),
            child: Text(
              text,
              style: TextStyle(
                color: Color(0xFFF9D3B4),
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ), // Text color
            ),
          ),
        ),
      ),
    );
  }
}
