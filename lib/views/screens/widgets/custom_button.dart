import 'package:flutter/material.dart';
import 'package:zoom_app/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback onPressed; //We require the call back not here but from the login page

  const CustomButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        primary: buttonColor,
        minimumSize: Size(double.infinity, 50),
      ),
      onPressed: onPressed,
      child: Text(
        text!,
        style: TextStyle(
          fontSize: 17,
        ),
      ),
    );
  }
}
