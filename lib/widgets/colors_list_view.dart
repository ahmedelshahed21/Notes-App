import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/widgets/card_color.dart';

class ColorsListView extends StatefulWidget{
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35*2,
      child: ListView.builder(
        itemCount: kColorsList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: GestureDetector(
            onTap: (){
              currentIndex=index;
              BlocProvider.of<AddNoteCubit>(context).color=kColorsList[index];
              setState(() {});
            },
            child: CardColor(color: kColorsList[index],isActive: currentIndex==index),
          ),
        );
      }),
    );
  }
}