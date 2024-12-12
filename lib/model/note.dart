import 'package:hive/hive.dart';
part 'note.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String tittle;
  @HiveField(1)
  String subtittle;
  @HiveField(2)
  final String date;
  @HiveField(3)
  int color;
  NoteModel(
      {required this.tittle,
      required this.subtittle,
      required this.date,
      required this.color});
}
