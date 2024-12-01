import 'package:flutter/material.dart';
import 'package:slot_machine/customs/slot.dart';

class Machine extends StatefulWidget {
  const Machine({required this.datas, super.key});

  final List<List<String>> datas;

  @override
  State<Machine> createState() => _MachineState();
}

class _MachineState extends State<Machine> {
  

  Widget show(List<List<String>> data) {
    List<Widget> asd = [];
    for (int i = 0; i < data.length; i++) {
      asd.add(Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...data[i].map((k) {
            return Slot(k);
          })
        ],
      ));
    }
    return Column(
      children: [
      ...asd.map((i) {
        return i;
      }),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white, width: 2)
      ),
      margin: const EdgeInsets.all(10),
      child: show(widget.datas),
    );
  }
}
