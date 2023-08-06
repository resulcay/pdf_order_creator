import 'package:flutter/material.dart';
import 'package:pdf_order_creator/service/path_service.dart';

class SelectBox extends StatefulWidget {
  final String imagePath;
  final String componentName;
  final String description;
  const SelectBox(
      {super.key,
      required this.imagePath,
      required this.componentName,
      required this.description});

  @override
  State<SelectBox> createState() => _SelectBoxState();
}

class _SelectBoxState extends State<SelectBox> {
  bool selection = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: selection,
      onChanged: (value) {
        setState(() {
          if (value != null) {
            selection = value;
          }
        });
      },
      title: SizedBox(
        height: 150,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.componentName),
                ),
                Image.asset(
                    height: 100,
                    alignment: Alignment.centerLeft,
                    PathService.imagePathProvider(widget.imagePath)),
              ],
            ),
            Flexible(
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8),
                  child: Text(widget.description),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
