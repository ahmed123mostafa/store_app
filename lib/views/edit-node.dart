import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/add_note_cubit/cubit/note_cubit_cubit.dart';

import 'package:notesapp/model/note.dart';

import 'package:notesapp/widget/custom-appbar.dart';
import 'package:notesapp/widget/customTextfield.dart';
import 'package:notesapp/widget/edite_color_listview.dart';

class Editnode extends StatefulWidget {
  const Editnode({super.key, required this.note});
  final NoteModel note;

  @override
  State<Editnode> createState() => _EditnodeState();
}

class _EditnodeState extends State<Editnode> {
  String? tittle, content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Customappbar(
              onpressed: () {
                widget.note.tittle = tittle ?? widget.note.tittle;
                widget.note.subtittle = content ?? widget.note.subtittle;
                widget.note.save();
                BlocProvider.of<NoteCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
              tittle: "Editenote",
              icon: Icons.check,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              onChanged: (value) {
                tittle = value;
              },
              hinttext: widget.note.tittle,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              onChanged: (value) {
                content = value;
              },
              hinttext: widget.note.subtittle,
              maxlines: 8,
            ),
            EditeColorlistview(
              note: widget.note,
            )
          ],
        ),
      ),
    );
  }
}
