import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:notesapp/constant/constant.dart';
import 'package:notesapp/model/note.dart';

part 'addnote_state.dart';

class AddnoteCubit extends Cubit<AddnoteState> {
  AddnoteCubit() : super(AddnoteInitial());
  Color color = const Color(0xff28502E);
  // ignore: non_constant_identifier_names
  AddNote(NoteModel note) async {
    note.color = color.value;
    emit(AddNoteloading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      print(note.tittle);
      emit(Addnotesuccses());
    } catch (e) {
      emit(AddNotefailure(e.toString()));
    }
  }
}
