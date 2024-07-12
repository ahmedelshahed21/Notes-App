// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextFormField extends StatelessWidget{
  CustomTextFormField({super.key,this.hintText,this.initialValue,this.maxLines=1,this.onSaved,this.onChanged});
  String? hintText;
  String? initialValue;
  int maxLines;
  void Function(String?)? onSaved;
  void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      onChanged: onChanged,
      validator: (data){
        if(data!.isEmpty){
          return 'Filed is required';
        }
        else{
          return null;
        }
      },
      initialValue: initialValue,
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        errorBorder: buildBorder(Colors.red),
        focusedErrorBorder: buildBorder(Colors.red),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
        hintText: hintText,
        hintStyle: const TextStyle(color: kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: color ?? Colors.white
        ),
      );
  }
}