import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    required this.textStyle,
    required this.backgroundColor,
    this.margin,
    this.padding,
  });

  final String text;
  final VoidCallback onTap;
  final double? width;
  final TextStyle textStyle;
  final Color backgroundColor;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: padding,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
