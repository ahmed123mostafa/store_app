import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:notesapp/add_note_cubit/cubit/note_cubit_cubit.dart';
import 'package:notesapp/constant/constant.dart';
import 'package:notesapp/model/note.dart';
import 'package:notesapp/simple_bloc_observer.dart';

import 'package:notesapp/views/viewnotes.dart';
//import 'package:notesapp/widget/addnotesheat.dart';

void main() async {
  Bloc.observer = SimpleBlocObservber();
  await Hive.initFlutter();
  //open Anew box with note
  //Rigester the adapter

  Bloc.observer = SimpleBlocObservber();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(),
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        debugShowCheckedModeBanner: false,
        home: const NotesViews(),
      ),
    );
  }
}
