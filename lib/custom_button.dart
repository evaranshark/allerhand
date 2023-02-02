import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final double width, height;
  final String name;
  final IconData icon;
  final EdgeInsets? padding;
  final bool filled;
  final Color? color;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    this.width = 176,
    this.height = 145,
    required this.name,
    required this.icon,
    required this.onPressed,
    this.padding,
    this.color = Colors.black,
    this.filled = false,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: filled
              ? CupertinoButton.filled(
                  onPressed: onPressed,
                  borderRadius: BorderRadius.circular(20),
                  padding: padding,
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      icon,
                      size: 89,
                    ),
                  ),
                )
              : CupertinoButton(
                  onPressed: onPressed,
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 230, 230, 230),
                  padding: padding,
                  child: Icon(
                    icon,
                    size: 72,
                    color: color,
                  ),
                ),
        ),
        Text(
          name,
          style: GoogleFonts.montserrat(
            fontSize: 32,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
