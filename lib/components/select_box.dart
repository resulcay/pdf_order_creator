import 'package:flutter/material.dart';
import 'package:pdf_order_creator/service/path_service.dart';

class SelectBox extends StatefulWidget {
  final String imagePath;
  final String componentName;
  final String description;
  final String price;
  final void Function(bool value) onBoolSelected;
  const SelectBox(
      {super.key,
      required this.imagePath,
      required this.componentName,
      required this.description,
      required this.price,
      required this.onBoolSelected});

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
        if (value != null) {
          setState(() {
            selection = value;
          });
          widget.onBoolSelected.call(value);
        }
      },
      title: SizedBox(
        height: 150,
        width: double.infinity,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.componentName,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
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
                      child: Text(widget.description,
                          style: const TextStyle(fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),
              ],
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  '${widget.price} €',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ))
          ],
        ),
      ),
    );
  }
}
