import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/my_colors.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final double fontSize;
  final TextEditingController controller;

  const MyTextField(
      {super.key,
      required this.hintText,
      required this.fontSize,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: GoogleFonts.nunito(
            color: MyColors.myHintText,
            fontWeight: FontWeight.normal,
            fontSize: fontSize,
          ),
        ),
        cursorColor: MyColors.myWhite,
        style: GoogleFonts.nunito(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: fontSize + 2,
        ),
        keyboardType: TextInputType.multiline,
        maxLines: null,
        controller: controller,
      ),
    );
  }
}
