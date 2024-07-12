import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/edit_note_body.dart';

class EditNoteView extends StatefulWidget{
  const EditNoteView({super.key,required this.note});
  final NoteModel note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteViewBody(note: widget.note)
    );

  }
}