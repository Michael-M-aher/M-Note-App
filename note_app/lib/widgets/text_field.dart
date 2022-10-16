import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;

import '../constants/my_colors.dart';

class MyTextField extends StatefulWidget {
  final String hintText;
  final double fontSize;
  final TextEditingController controller;

  const MyTextField(
      {super.key,
      required this.hintText,
      required this.fontSize,
      required this.controller});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: GoogleFonts.nunito(
            color: MyColors.myHintText,
            fontWeight: FontWeight.normal,
            fontSize: widget.fontSize,
          ),
        ),
        cursorColor: MyColors.myWhite,
        style: GoogleFonts.nunito(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: widget.fontSize + 2,
        ),
        keyboardType: TextInputType.multiline,
        maxLines: null,
        textDirection: isRTL(widget.controller.text)
            ? TextDirection.rtl
            : TextDirection.ltr,
        controller: widget.controller,
        onChanged: (value) => setState(() {}),
      ),
    );
  }
}

bool isRTL(String text) {
  return intl.Bidi.detectRtlDirectionality(text);
}
