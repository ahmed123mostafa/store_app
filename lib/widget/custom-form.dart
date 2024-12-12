import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notesapp/add_note_cubit/cubit/addnote_cubit.dart';

import 'package:notesapp/model/note.dart';
import 'package:notesapp/widget/color_listview.dart';
import 'package:notesapp/widget/customTextfield.dart';
import 'package:notesapp/widget/custombutton.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? tittle, subtittle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextField(
            onsaved: (value) {
              tittle = value;
            },
            hinttext: "tittle",
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            onsaved: (value) {
              subtittle = value;
            },
            hinttext: "content",
            maxlines: 8,
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomColorview(),
          BlocBuilder<AddnoteCubit, AddnoteState>(
            builder: (context, state) {
              return CustomButton(
                isloading: state is AddNoteloading ? true : false,
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    var currentData = DateTime.now();
                    var currentFormatedData =
                        DateFormat('dd-mm-yyyy').format(currentData);

                    var notemodel = NoteModel(
                        tittle: tittle!,
                        subtittle: subtittle!,
                        date: currentFormatedData,
                        color: Colors.blue.value);
                    BlocProvider.of<AddnoteCubit>(context).AddNote(notemodel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 4,
          )
        ],
      ),
    );
  }
}
