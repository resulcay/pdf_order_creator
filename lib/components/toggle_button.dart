// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pdf_order_creator/components/model_provider.dart';
import 'package:pdf_order_creator/home_page.dart';

import 'package:pdf_order_creator/service/path_service.dart';
import 'package:provider/provider.dart';

class ToggleButton extends StatefulWidget {
  final List<bool> myItems;
  const ToggleButton({
    Key? key,
    required this.myItems,
  }) : super(key: key);

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ToggleButtons(
        onPressed: (int index) {
          setState(() {
            // The button that is tapped is set to true, and the others to false.
            for (int i = 0; i < widget.myItems.length; i++) {
              widget.myItems[i] = i == index;
              if (widget.myItems[i]) {
                Provider.of<ModelProvider>(context, listen: false)
                    .changeModel(Model.values[i + 1]);
              }
            }
          });
        },
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        selectedBorderColor: Colors.blue[700],
        selectedColor: Colors.white,
        fillColor: Colors.blue[800],
        color: Colors.blue[400],
        isSelected: widget.myItems,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                    height: MediaQuery.of(context).size.width * .3,
                    PathService.imagePathProvider('wild drop.png')),
              ),
              const Spacer(),
              const Text(
                'Wild Drop',
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                    height: MediaQuery.of(context).size.width * .3,
                    PathService.imagePathProvider('widen drop.png')),
              ),
              const Spacer(),
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
