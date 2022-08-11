import 'package:flutter/material.dart';
import '../constants/my_colors.dart';

class MyProgressBar extends StatelessWidget {
  const MyProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 50,
      height: 50,
      child: CircularProgressIndicator(
        color: MyColors.myGrey,
      ),
    );
  }
}
