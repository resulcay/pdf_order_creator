import 'package:flutter/material.dart';
import 'package:pdf_order_creator/components/color_circle.dart';
import 'package:pdf_order_creator/components/color_type_provider.dart';
import 'package:pdf_order_creator/components/component_widget.dart';
import 'package:pdf_order_creator/constants/color_constants.dart';
import 'package:pdf_order_creator/enums/color_type_enum.dart';
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
  String normalColorName = ColorConstants.normalTonesNames[0];
  String doubleBodyColorName = ColorConstants.proTonesNames[0];
  String doubleFrameColorName = ColorConstants.proTonesNames[0];
  String metallicColorName = ColorConstants.metallicTonesNames[0];

  @override
  Widget build(BuildContext context) {
    ColorType? colorType = Provider.of<ColorTypeProvider>(context).colorType;

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

                        setState(() {
                          singleColor = value;
                          normalColorName =
                              ColorConstants.normalTonesNames[index];
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
              const ComponentWidget()
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
                                setState(() {
                                  doubleBodyColor = value;
                                  doubleBodyColorName =
                                      ColorConstants.proTonesNames[index];
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
                                setState(() {
                                  doubleFrameColor = value;
                                  doubleFrameColorName =
                                      ColorConstants.proTonesNames[index];
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
              const ComponentWidget()
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
                      setState(() {
                        metallicColor = value;
                        metallicColorName =
                            ColorConstants.metallicTonesNames[index];
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
              const ComponentWidget()
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
