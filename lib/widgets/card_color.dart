import 'package:flutter/material.dart';

class CardColor extends StatefulWidget{
  const CardColor({super.key,required this.color,required this.isActive});
  final bool isActive;
  final Color color;

  @override
  State<CardColor> createState() => _CardColorState();
}

class _CardColorState extends State<CardColor> {
  @override
  Widget build(BuildContext context) {
    return widget.isActive ? CircleAvatar(
      backgroundColor: Colors.white,
      radius: 35,
      child: CircleAvatar(
        backgroundColor: widget.color,
      radius: 32,)) : CircleAvatar(
      backgroundColor: widget.color,
      radius: 32,
    ) ;
  }
}

