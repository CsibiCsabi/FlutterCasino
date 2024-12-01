import 'package:flutter/material.dart';

class Slot extends StatelessWidget {
  Slot(this.value, {super.key});

  final String value;

  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 91, 12, 7),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Center(
        child: Image(image: AssetImage(value == '1' ? 'lib/data/imgs/cherry.png' : value == '2' ? 'lib/data/imgs/lemon.png' : 'lib/data/imgs/watermelon.png'))
      ),
    );
  }
}
