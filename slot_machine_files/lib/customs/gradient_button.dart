import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({required this.onPressed, required this.data, super.key});

  final void Function() onPressed;

  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(colors: [Color.fromARGB(255, 239, 158, 209), Color.fromARGB(255, 168, 15, 117)])
      ),
      child: TextButton(
        onPressed: onPressed,
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.transparent),
          textStyle: WidgetStatePropertyAll(
            TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          foregroundColor: WidgetStatePropertyAll(Colors.black),
        ),
        child: Text(data),
        ),
    );
  }
}