import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/widgets/notes_view_body.dart';

class HomeView extends StatelessWidget{
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        backgroundColor: kPrimaryColor,
        onPressed: (){
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)
            ),
              isScrollControlled: true,
              context: context, builder: (context){
            return const AddNoteBottomSheet();
          });
        },
        child: const Icon(Icons.add),
      ),
      body: const NotesViewBody(),
    );
  }
}