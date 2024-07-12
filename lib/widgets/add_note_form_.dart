import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });



  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> key=GlobalKey();
  AutovalidateMode autoValidateMode=AutovalidateMode.disabled;
  String? title,subTitle;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Column(
        children: [
          const SizedBox(height: 40),
          CustomTextFormField(
            hintText: 'Title',
            onSaved: (data){
              title=data;
            },
          ),
          const SizedBox(height: 15),
          CustomTextFormField(
            hintText: 'Content',
            maxLines: 5,
            onSaved: (data){
              subTitle=data;
            },
          ),
          const SizedBox(height: 30),
          const ColorsListView(),
          const SizedBox(height: 30),
          BlocBuilder<AddNoteCubit,AddNoteState>(
            builder: (context,state){
              return CustomButton(
              isLoading: state is AddNoteLoading ? true : false,
              onTap: (){
                if(key.currentState!.validate()){
                  var currentDate=DateTime.now();
                  var formattedDate=DateFormat("dd-mm-yyyy").format(currentDate);

                  key.currentState!.save();
                  var note=NoteModel(title: title!, subTitle: subTitle!, date: formattedDate, color: Colors.red.value);
                  BlocProvider.of<AddNoteCubit>(context).addNote(note);
                }
                else{
                  autoValidateMode=AutovalidateMode.always;
                  setState(() {});
                }
              },
            );
          }
        ),
        const SizedBox(
          height: 30,
         )
        ],
      ),
    );
  }

}
