// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  CustomIcon({super.key,required this.icon,this.onPressed});
  final IconData icon;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12)
        ),
        child: IconButton(
            onPressed:onPressed,
            icon: Icon(icon)
        )
    );
  }
}