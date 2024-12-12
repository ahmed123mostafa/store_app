import 'package:flutter/material.dart';

import 'package:notesapp/widget/customIcons.dart';

class Customappbar extends StatelessWidget {
  const Customappbar(
      {super.key, required this.tittle, required this.icon, this.onpressed});
  final String tittle;
  final IconData icon;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          tittle,
          style: const TextStyle(
              fontSize: 20, color: Colors.white, fontStyle: FontStyle.italic),
        ),
        const Spacer(),
        CustomSearchIcon(
          onpressed: onpressed,
          icon: icon,
        )
      ],
    );
  }
}
