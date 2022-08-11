import 'package:flutter/material.dart';
import '../constants/my_colors.dart';

class MyAppBar extends StatelessWidget {
  final VoidCallback saveclk;

  const MyAppBar({super.key, required this.saveclk});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            click: () => Navigator.maybePop(context),
          ),
          const SizedBox(
            width: 20,
          ),
          MyButton(
            icon: const Icon(Icons.save_outlined),
            click: saveclk,
          ),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback click;

  const MyButton({super.key, required this.icon, required this.click});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(10),
            ),
            backgroundColor: MaterialStateProperty.all(MyColors.myGrey),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            )),
        onPressed: click,
        child: icon,
      ),
    );
  }
}
