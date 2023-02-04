import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final double width, height;
  final String? name;
  final IconData icon;
  final double? iconSize;
  final EdgeInsets? padding;
  final bool filled;
  final Color? contentColor;
  final Color? color;
  final EdgeInsets? namePadding;
  final VoidCallback onPressed;

  const CustomButton(
      {super.key,
      this.width = 176,
      this.height = 145,
      this.name,
      required this.icon,
      this.iconSize,
      required this.onPressed,
      this.padding,
      this.contentColor = Colors.black,
      this.color,
      this.filled = false,
      this.namePadding});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //button
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
                      size: iconSize ?? 89,
                    ),
                  ),
                )
              : CupertinoButton(
                  onPressed: onPressed,
                  borderRadius: BorderRadius.circular(20),
                  color: color ?? const Color.fromARGB(255, 230, 230, 230),
                  padding: padding,
                  child: Center(
                    child: Icon(
                      icon,
                      size: iconSize ?? 72,
                      color: contentColor,
                    ),
                  ),
                ),
        ),
        if (name != null)
          Padding(
            padding: namePadding ?? const EdgeInsets.only(top: 14),
            child: Text(
              name!,
              style: GoogleFonts.montserrat(
                fontSize: 32,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
      ],
    );
  }
}
