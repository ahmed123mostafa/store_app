part of 'addnote_cubit.dart';

@immutable
class AddnoteState {}

class AddnoteInitial extends AddnoteState {}

class AddNoteloading extends AddnoteState {}

class Addnotesuccses extends AddnoteState {}

class AddNotefailure extends AddnoteState {
  final String ermessage;

  AddNotefailure(this.ermessage);
}
