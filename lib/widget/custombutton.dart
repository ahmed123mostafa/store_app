import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, this.isloading = false});
  final void Function()? onTap;
  final bool isloading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.blue),
        child: Center(
            child: isloading
                ? const CircularProgressIndicator(
                    color: Colors.black,
                  )
                : const Text(
                    "Add",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
      ),
    );
  }
}
