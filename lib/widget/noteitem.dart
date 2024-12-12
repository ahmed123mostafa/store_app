import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/add_note_cubit/cubit/note_cubit_cubit.dart';
import 'package:notesapp/model/note.dart';
import 'package:notesapp/views/edit-node.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Editnode(
                      note: note,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
              color: Color(note.color),
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(top: 4, right: 2),
                    child: Text(
                      note.tittle,
                      style: const TextStyle(fontSize: 26, color: Colors.black),
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      note.subtittle,
                      style:
                          const TextStyle(fontSize: 13, color: Colors.black45),
                    ),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        note.delete();
                        BlocProvider.of<NoteCubit>(context).fetchAllNotes();
                      },
                      icon: const Padding(
                        padding: EdgeInsets.only(left: 2, top: 1),
                        child: Icon(
                          Icons.delete_sharp,
                          color: Colors.black,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    note.date,
                    style: const TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
