import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:notesapp/constant/constant.dart';
import 'package:notesapp/model/note.dart';

part 'note_cubit_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteCubitInitial());

  List<NoteModel>? notes;

  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);

    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }
}
  // Fetch all notes asynchronously
  