import 'package:flutter/material.dart';
import 'package:pdf_order_creator/service/path_service.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({super.key});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  List<bool> myItems = [false, false];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ToggleButtons(
        onPressed: (int index) {
          setState(() {
            // The button that is tapped is set to true, and the others to false.
            for (int i = 0; i < myItems.length; i++) {
              myItems[i] = i == index;
            }
          });
        },
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        selectedBorderColor: Colors.blue[700],
        selectedColor: Colors.white,
        fillColor: Colors.blue[800],
        color: Colors.blue[400],
        isSelected: myItems,
        children: [
          Column(
            children: [
              Image.asset(
                  height: MediaQuery.of(context).size.width * .31,
                  PathService.imagePathProvider('wild drop.png')),
              const Text(
                'Wild Drop',
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          Column(
            children: [
              Image.asset(
                  height: MediaQuery.of(context).size.width * .32,
                  PathService.imagePathProvider('widen drop.png')),
              const Text(
                'Widen Drop',
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ],
      ),
    );
  }
}
