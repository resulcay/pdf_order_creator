import 'package:flutter/material.dart';
import 'package:pdf_order_creator/components/drop_down_component.dart';
import 'package:pdf_order_creator/components/select_box.dart';
import 'package:pdf_order_creator/models/component_model.dart';

class WildDropWidget extends StatelessWidget {
  const WildDropWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropDownComponent(
          onPeriodSelected: (period) => null,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Theme.of(context).highlightColor,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Extra Components',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
        Column(
          children: List.generate(
              Component.wildDropExtra.length,
              (index) => Column(
                    children: [
                      SelectBox(
                          componentName: Component.wildDropExtra[index].name,
                          description:
                              Component.wildDropExtra[index].description,
                          imagePath: Component.wildDropExtra[index].imagePath ??
                              'wild drop.png'),
                      const Divider(),
                    ],
                  )),
        ),
      ],
    );
  }
}
