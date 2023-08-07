import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:pdf_order_creator/constants/color_constants.dart';

class ColorCircle extends StatefulWidget {
  final Color color;
  final List<Color> colors;
  final void Function(Color color) onColorSelected;
  const ColorCircle({
    super.key,
    required this.color,
    required this.onColorSelected,
    required this.colors,
  });

  @override
  State<ColorCircle> createState() => _ColorCircleState();
}

class _ColorCircleState extends State<ColorCircle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Colors'),
              content: BlockPicker(
                availableColors: widget.colors,
                pickerColor: widget.color,
                onColorChanged: (value) {
                  widget.onColorSelected.call(value);
                },
              ),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
        child: CircleAvatar(
          maxRadius: 19,
          backgroundColor: ColorConstants.pureWhite,
          child: CircleAvatar(
            maxRadius: 18,
            backgroundColor: widget.color,
          ),
        ),
      ),
    );
  }
}
