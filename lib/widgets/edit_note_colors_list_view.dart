import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/card_color.dart';

class EditNoteColorsListView extends StatefulWidget{
  final NoteModel note;

  const EditNoteColorsListView({super.key,required this.note});

  @override
  State<EditNoteColorsListView> createState() => _EditNoteColorsListViewState();
}

class _EditNoteColorsListViewState extends State<EditNoteColorsListView> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex=kColorsList.indexOf(Color(widget.note.color));
    super.initState();
  }

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
                  widget.note.color=kColorsList[index].value;
                  setState(() {});
                },
                child: CardColor(color: kColorsList[index],isActive: currentIndex==index),
              ),
            );
          }),
    );
  }
}