import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/add_note_cubit/cubit/note_cubit_cubit.dart';
import 'package:notesapp/model/note.dart';
import 'package:notesapp/views/edit-node.dart';
import 'package:notesapp/widget/addnotesheat.dart';

import 'package:notesapp/widget/custom-appbar.dart';
import 'package:notesapp/widget/customlistview.dart';
import 'package:notesapp/widget/noteitem.dart';

class NotesViews extends StatefulWidget {
  const NotesViews({super.key});

  @override
  State<NotesViews> createState() => _NotesViewsState();
}

class _NotesViewsState extends State<NotesViews> {
  @override
  void initState() {
    BlocProvider.of<NoteCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [
              SizedBox(
                height: 40,
              ),
              Customappbar(
                tittle: "Note",
                icon: Icons.search,
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(child: CustoListview()),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                context: context,
                builder: (context) {
                  return const AddNoteSheat();
                });
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ));
  }
}
