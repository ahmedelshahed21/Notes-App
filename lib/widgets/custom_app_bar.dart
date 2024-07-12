// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget{
  CustomAppBar({super.key,required this.text,required this.icon,this.onPressed});
  final String text;
  final IconData icon;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(text,
        style: const TextStyle(fontSize: 28,color: Colors.white),
        ),
        CustomIcon(icon: icon,onPressed: onPressed)
      ]
    );
  }
}

