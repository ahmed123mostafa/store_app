import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notesapp/add_note_cubit/cubit/addnote_cubit.dart';
import 'package:notesapp/add_note_cubit/cubit/note_cubit_cubit.dart';
import 'package:notesapp/widget/custom-form.dart';

class AddNoteSheat extends StatefulWidget {
  const AddNoteSheat({super.key});

  @override
  State<AddNoteSheat> createState() => _AddNoteSheatState();
}

class _AddNoteSheatState extends State<AddNoteSheat> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddnoteCubit(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<AddnoteCubit, AddnoteState>(
          listener: (context, state) {
            if (state is AddNotefailure) {}

            if (state is Addnotesuccses) {
              BlocProvider.of<NoteCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
                absorbing: state is AddNoteloading ? true : false,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: SingleChildScrollView(child: CustomForm()),
                ));
          },
        ),
      ),
    );
  }
}
