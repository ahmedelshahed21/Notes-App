import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';
import 'package:notes_app/widgets/edit_note_colors_list_view.dart';

class EditNoteViewBody extends StatefulWidget{
  const EditNoteViewBody({super.key,required this.note});
  final NoteModel note;
  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title,content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 50),
          CustomAppBar(
            text: 'Edit Note',
            icon: Icons.check,
            onPressed: (){
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = content ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 50),
          CustomTextFormField(
            initialValue: widget.note.title,
            onChanged: (data){
              title=data;
          },),
          const SizedBox(height: 15),
          CustomTextFormField(
              initialValue: widget.note.subTitle,
              maxLines: 5,
              onChanged: (data){
                content=data;
              },
          ),
          const SizedBox(height: 15),
          EditNoteColorsListView(note: widget.note),

        ],
      ),
    );
  }
}