import 'package:flutter/material.dart';
import 'package:pdf_order_creator/components/select_box.dart';
import 'package:pdf_order_creator/models/component_model.dart';

class ComponentWidget extends StatelessWidget {
  const ComponentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Card(
              color: Theme.of(context).highlightColor,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Extra Components',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
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
                        description: Component.wildDropExtra[index].description,
                        imagePath: Component.wildDropExtra[index].imagePath ??
                            'wild drop.png',
                        price: Component.wildDropExtra[index].price,
                        onBoolSelected: (value) =>
                            Component.wildDropExtra[index].isSelected = value,
                      ),
                      const Divider(),
                    ],
                  )),
        ),
      ],
    );
  }
}
