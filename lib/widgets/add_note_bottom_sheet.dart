import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/add_note_form_.dart';

class AddNoteBottomSheet extends StatefulWidget{
  const AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit,AddNoteState>(
          listener: (context,state){
            if(state is AddNoteFailure){
              print('failed ${state.errMessage}');
            }
            if(state is AddNoteSuccess){
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            }
          },
          builder: (context,state){
            return Padding(padding: EdgeInsets.only(right: 16, left: 16, bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(
                  child: AddNoteForm()
              ),
            );
          },
      ),
    );
  }
}

