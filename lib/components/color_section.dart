import 'package:flutter/material.dart';
import 'package:pdf_order_creator/components/color_circle.dart';
import 'package:pdf_order_creator/components/color_name_provider.dart';
import 'package:pdf_order_creator/components/color_type_provider.dart';
import 'package:pdf_order_creator/components/component_widget.dart';
import 'package:pdf_order_creator/components/model_provider.dart';
import 'package:pdf_order_creator/constants/color_constants.dart';
import 'package:pdf_order_creator/enums/color_type_enum.dart';
import 'package:pdf_order_creator/enums/model_enum.dart';
import 'package:pdf_order_creator/models/component_model.dart';
import 'package:provider/provider.dart';

class ColorSection extends StatefulWidget {
  const ColorSection({super.key});

  @override
  State<ColorSection> createState() => _ColorSectionState();
}

class _ColorSectionState extends State<ColorSection> {
  Color singleColor = ColorConstants.n01White;
  Color doubleBodyColor = ColorConstants.p43Black;
  Color doubleFrameColor = ColorConstants.p43Black;
  Color metallicColor = ColorConstants.m101Pearl;
  List<Component> componentList = [];
  @override
  Widget build(BuildContext context) {
    ColorType? colorType = Provider.of<ColorTypeProvider>(context).colorType;
    Model model = Provider.of<ModelProvider>(context).model;

    switch (model) {
      case Model.wildDrop:
        componentList = Component.wildDropExtra;
        break;
      case Model.widenDrop:
        componentList = Component.widenDropExtra;
        break;
      default:
    }

    String normalColorName =
        Provider.of<ColorNameProvider>(context).normalColorName;
    String doubleBodyColorName =
        Provider.of<ColorNameProvider>(context).doubleBodyColorName;
    String doubleFrameColorName =
        Provider.of<ColorNameProvider>(context).doubleFrameColorName;
    String metallicColorName =
        Provider.of<ColorNameProvider>(context).metallicColorName;

    if (colorType != null) {
      switch (colorType) {
        case ColorType.Single:
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 12, bottom: 12),
                child: Row(
                  children: [
                    Text(
                      'Caravan Color :',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    ColorCircle(
                      color: singleColor,
                      colors: ColorConstants.normalTones,
                      onColorSelected: (value) {
                        int index = ColorConstants.normalTones.indexOf(value);
                        Provider.of<ColorNameProvider>(context, listen: false)
                            .changeNormalColorName(
                                ColorConstants.normalTonesNames[index]);
                        setState(() {
                          singleColor = value;
                        });
                      },
                    ),
                    const Spacer(),
                    Text(
                      normalColorName,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontWeight: FontWeight.w300, fontSize: 18),
                    ),
                    const Spacer(),
                    Text(
                      '0 €',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              ComponentWidget(components: componentList)
            ],
          );
        case ColorType.Double:
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: Colors.white,
                    )),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Body Color :',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                            ),
                            ColorCircle(
                              color: doubleBodyColor,
                              colors: ColorConstants.proTones,
                              onColorSelected: (value) {
                                int index =
                                    ColorConstants.proTones.indexOf(value);
                                Provider.of<ColorNameProvider>(context,
                                        listen: false)
                                    .changeDoubleBodyColorName(
                                        ColorConstants.proTonesNames[index]);
                                setState(() {
                                  doubleBodyColor = value;
                                });
                              },
                            ),
                            Text(
                              doubleBodyColorName,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 17),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Frame Color :',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                            ),
                            ColorCircle(
                              color: doubleFrameColor,
                              colors: ColorConstants.proTones,
                              onColorSelected: (value) {
                                int index =
                                    ColorConstants.proTones.indexOf(value);
                                Provider.of<ColorNameProvider>(context,
                                        listen: false)
                                    .changeDoubleFrameColorName(
                                        ColorConstants.proTonesNames[index]);
                                setState(() {
                                  doubleFrameColor = value;
                                });
                              },
                            ),
                            Text(
                              doubleFrameColorName,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 17),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      '799 €',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const Spacer()
                  ],
                ),
              ),
              ComponentWidget(components: componentList)
            ],
          );
        case ColorType.Metallic:
          return Column(
            children: [
              Row(
                children: [
                  Text(
                    'Metallic Color :',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  ColorCircle(
                    color: metallicColor,
                    colors: ColorConstants.metallicTones,
                    onColorSelected: (value) {
                      int index = ColorConstants.metallicTones.indexOf(value);
                      Provider.of<ColorNameProvider>(context, listen: false)
                          .changeMetallicColorName(
                              ColorConstants.metallicTonesNames[index]);
                      setState(() {
                        metallicColor = value;
                      });
                    },
                  ),
                  Text(
                    metallicColorName,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontWeight: FontWeight.w300, fontSize: 17),
                  ),
                  const Spacer(),
                  Text(
                    '1750 €',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const Spacer(),
                ],
              ),
              ComponentWidget(components: componentList)
            ],
          );

        default:
          return const SizedBox.shrink();
      }
    } else {
      return const SizedBox.shrink();
    }
  }
}
