import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_states.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/note_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit,NotesState>(
      builder: (context,state){
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (context,index){
              return NoteCard(note: notes[index]);
            },
            itemCount: notes.length,
            // reverse: true,
          ),
        );
      },
    );
  }
}