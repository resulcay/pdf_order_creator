import 'package:flutter/material.dart';
import 'package:pdf_order_creator/components/color_section.dart';
import 'package:pdf_order_creator/components/drop_down_component.dart';

class WidenDropWidget extends StatelessWidget {
  const WidenDropWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        DropDownComponent(),
        ColorSection(),
      ],
    );
  }
}
