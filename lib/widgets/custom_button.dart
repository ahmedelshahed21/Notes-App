import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomButton extends StatelessWidget{
  const CustomButton({super.key, required this.onTap,this.isLoading=false});
  final void Function()? onTap;
  final isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kPrimaryColor,
        ),
        child: Center(
          child: isLoading ? const CircularProgressIndicator(
            color: Colors.black,
          ): const Text('Add',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),

          ),
        ),
      ),
    );
  }
}