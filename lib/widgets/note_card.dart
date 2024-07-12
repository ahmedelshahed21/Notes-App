import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteCard extends StatelessWidget{
  const NoteCard({super.key,required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return EditNoteView(note: note);
        }));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        padding: const EdgeInsets.only(top: 24.0,bottom: 24.0,left: 16.0),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(note.title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 26
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(note.subTitle,
                  style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                  ),

                ),
              ),
              trailing: IconButton(
                onPressed: (){
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 26,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(note.date,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }



}