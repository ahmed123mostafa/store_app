import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/add_note_cubit/cubit/addnote_cubit.dart';
import 'package:notesapp/constant/constant.dart';

class CustomColor extends StatelessWidget {
  const CustomColor(
      {super.key, required this.activecolor, required this.color});
  final bool activecolor;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return activecolor
        ? CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 29,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 33,
          );
  }
}

class CustomColorview extends StatefulWidget {
  const CustomColorview({super.key});

  @override
  State<CustomColorview> createState() => _CustomColorviewState();
}

class _CustomColorviewState extends State<CustomColorview> {
  // ignore: non_constant_identifier_names
  int Currentcolor = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: Kcolors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (contex, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                Currentcolor = index;
                BlocProvider.of<AddnoteCubit>(context).color = Kcolors[index];
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
