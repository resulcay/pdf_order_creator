import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pdf_order_creator/components/select_box.dart';
import 'package:pdf_order_creator/localization/locale_keys.g.dart';
import 'package:pdf_order_creator/models/component_model.dart';

class ComponentWidget extends StatefulWidget {
  final List<Component> components;
  const ComponentWidget({super.key, required this.components});

  @override
  State<ComponentWidget> createState() => _ComponentWidgetState();
}

class _ComponentWidgetState extends State<ComponentWidget> {
  late List<bool> isEnabled;
  @override
  void initState() {
    isEnabled = List.generate(widget.components.length, (index) => true);
    super.initState();
  }

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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    LocaleKeys.extraComponent.tr(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Column(
          children: List.generate(
              widget.components.length,
              (index) => Column(
                    children: [
                      SelectBox(
                        isEnabled: isEnabled[index],
                        componentName: widget.components[index].name,
                        description: widget.components[index].description,
                        imagePath: widget.components[index].imagePath ??
                            'wild drop.png',
                        price: widget.components[index].price,
                        onBoolSelected: (value) {
                          widget.components[index].isSelected = value;
                          setState(() {
                            if (index == 4) {
                              widget.components[5].isSelected = false;
                              isEnabled[5] = !widget.components[4].isSelected;
                            }
                            if (index == 5) {
                              widget.components[4].isSelected = false;
                              isEnabled[4] = !widget.components[5].isSelected;
                            }

                            if (index == 11) {
                              widget.components[12].isSelected = false;
                              isEnabled[12] = !widget.components[11].isSelected;
                            }
                            if (index == 12) {
                              widget.components[11].isSelected = false;
                              isEnabled[11] = !widget.components[12].isSelected;
                            }
                            if (index == 13) {
                              widget.components[14].isSelected = false;
                              isEnabled[14] = !widget.components[13].isSelected;
                            }
                            if (index == 14) {
                              widget.components[13].isSelected = false;
                              isEnabled[13] = !widget.components[14].isSelected;
                            }
                            if (index == 15) {
                              widget.components[16].isSelected = false;
                              isEnabled[16] = !widget.components[15].isSelected;
                            }
                            if (index == 16) {
                              widget.components[15].isSelected = false;
                              isEnabled[15] = !widget.components[16].isSelected;
                            }
                          });
                        },
                      ),
                      const Divider(),
                    ],
                  )),
        ),
      ],
    );
  }
}
