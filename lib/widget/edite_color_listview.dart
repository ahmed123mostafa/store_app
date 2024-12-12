import 'package:flutter/material.dart';
import 'package:notesapp/constant/constant.dart';
import 'package:notesapp/model/note.dart';
import 'package:notesapp/widget/color_listview.dart';

class EditeColorlistview extends StatefulWidget {
  const EditeColorlistview({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditeColorlistview> createState() => _EditeColorlistviewState();
}

class _EditeColorlistviewState extends State<EditeColorlistview> {
  // ignore: non_constant_identifier_names
  late int Currentcolor;
  @override
  void initState() {
    Currentcolor = Kcolors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: Kcolors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (contex, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                Currentcolor = index;
                widget.note.color = Kcolors[index].value;
                setState(() {});
              },
              child: CustomColor(
                activecolor: Currentcolor == index,
                color: Kcolors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
