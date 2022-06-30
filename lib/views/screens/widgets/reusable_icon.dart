import 'package:flutter/material.dart';
import 'package:zoom_app/utils/colors.dart';

class ReuseAbleIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const ReuseAbleIcon({Key? key, required this.icon, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: buttonColor.withAlpha(60),
                  blurRadius: 20.0,
                  spreadRadius: 8.0,
                  offset: Offset(
                    1.0,
                    3.0,
                  ),
                ),
              ],
              color: buttonColor,
            ),
            child: Icon(
              icon,
              size: 30,
            ),
          ),
        ),
        SizedBox(height: 10,),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
