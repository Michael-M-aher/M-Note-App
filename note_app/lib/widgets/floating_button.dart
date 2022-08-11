import 'package:flutter/material.dart';
import '../constants/my_colors.dart';

class MyFloatingButton extends StatelessWidget {
  final VoidCallback clk;
  final Icon icon;

  const MyFloatingButton({super.key, required this.clk, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: const BoxDecoration(
          color: MyColors.myDarkGrey,
          borderRadius: BorderRadius.all(
            Radius.circular(35.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(-2, 1),
            )
          ]),
      child: FloatingActionButton(
        backgroundColor: MyColors.myDarkGrey,
        elevation: 8,
        onPressed: clk,
        child: icon,
      ),
    );
  }
}
