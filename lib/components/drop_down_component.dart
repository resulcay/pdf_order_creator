import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pdf_order_creator/constants/color_constants.dart';

class DropDownComponent extends StatefulWidget {
  final void Function(String period) onPeriodSelected;

  const DropDownComponent({
    super.key,
    required this.onPeriodSelected,
  });

  @override
  State<DropDownComponent> createState() => _DropDownComponentState();
}

class _DropDownComponentState extends State<DropDownComponent> {
  String? notificationPeriod;

  void _updatePeriod(String? period) {
    if (notificationPeriod != null) {
      widget.onPeriodSelected.call(notificationPeriod!);
    }
  }

  List<String> items = ['Common', 'Pro', 'Metallic'];
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: const Text('Select Color Type'),
      borderRadius: BorderRadius.circular(10),
      icon: const Icon(
        Icons.arrow_drop_down_circle_outlined,
      ),
      dropdownColor: ColorConstants.primaryColor,
      value: notificationPeriod,
      items: items.map((String period) {
        return DropdownMenuItem(
          value: period,
          child: Text(
            period,
          ),
        );
      }).toList(),
      onChanged: _updatePeriod,
    );
  }
}
