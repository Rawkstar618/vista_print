import 'package:flutter/material.dart';

class NPSButtonTemplate extends StatelessWidget {
  final List<String> text;
  final void Function() onPressed;
  const NPSButtonTemplate(
      {required this.onPressed, required this.text, super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: const MaterialStatePropertyAll(
          Color.fromARGB(255, 42, 0, 49),
        ),
        backgroundColor: const MaterialStatePropertyAll(
          Color.fromARGB(255, 192, 200, 255),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
        minimumSize: const MaterialStatePropertyAll(Size.square(200)),
      ),
      child: Column(
        children: [
          Text(
              style: const TextStyle(fontSize: 70, fontWeight: FontWeight.w200),
              textAlign: TextAlign.center,
              text[0]),
          Text(
              style: const TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
              text[1])
        ],
      ),
    );
  }
}
