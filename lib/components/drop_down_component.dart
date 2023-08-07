import 'package:flutter/material.dart';
import 'package:pdf_order_creator/components/color_type_provider.dart';
import 'package:pdf_order_creator/constants/color_constants.dart';
import 'package:pdf_order_creator/enums/color_type_enum.dart';
import 'package:provider/provider.dart';

class DropDownComponent extends StatefulWidget {
  const DropDownComponent({super.key});

  @override
  State<DropDownComponent> createState() => _DropDownComponentState();
}

class _DropDownComponentState extends State<DropDownComponent> {
  String? text;

  void _updatePeriod(String? value) {
    setState(() {
      text = value;
      switch (value) {
        case 'Single':
          Provider.of<ColorTypeProvider>(context, listen: false)
              .changeColor(ColorType.Single);
          break;
        case 'Double':
          Provider.of<ColorTypeProvider>(context, listen: false)
              .changeColor(ColorType.Double);
          break;
        case 'Metallic':
          Provider.of<ColorTypeProvider>(context, listen: false)
              .changeColor(ColorType.Metallic);
          break;
        default:
      }
    });
  }

  List<ColorType> colorTypes = ColorType.values;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      hint: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Select Color Type'),
      ),
      borderRadius: BorderRadius.circular(10),
      icon: const Icon(Icons.keyboard_arrow_down_sharp),
      dropdownColor: ColorConstants.primaryColor,
      value: text,
      items: colorTypes.map((ColorType value) {
        return DropdownMenuItem(
          value: value.name,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              value.name,
            ),
          ),
        );
      }).toList(),
      onChanged: (value) => _updatePeriod(value),
    );
  }
}
