import 'package:flutter/material.dart';
import 'package:pdf_order_creator/components/color_section.dart';
import 'package:pdf_order_creator/components/drop_down_component.dart';

class WildDropWidget extends StatelessWidget {
  const WildDropWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DropDownComponent(),
        ColorSection(),
      ],
    );
  }
}
