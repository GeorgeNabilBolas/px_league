import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    required this.textStyle,
    required this.backgroundColor,
  });

  final String text;
  final VoidCallback onTap;
  final double? width;
  final TextStyle textStyle;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        padding: const EdgeInsets.all(10),
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
