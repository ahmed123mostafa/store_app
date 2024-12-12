import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.hinttext,
      this.onsaved,
      this.prefixicon,
      this.onChanged,
      this.textinputtype,
      this.maxlines = 1});
  final String hinttext;
  Function(String)? onChanged;
  TextInputType? textinputtype;
  Icon? prefixicon;
  final int maxlines;
  final void Function(String?)? onsaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onsaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "field is required";
        } else {
          return null;
        }
      },
      maxLines: maxlines,
      textAlign: TextAlign.center,
      keyboardType: textinputtype,
      decoration: InputDecoration(
          prefixIcon: prefixicon,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          hintText: hinttext,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(width: 1, color: Colors.blue)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.blue, width: 2)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
