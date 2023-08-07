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
  Color doubleBodyColor = ColorConstants.p15Yellow;
  Color doubleFrameColor = ColorConstants.p17Yellow;
  Color metallicColor = ColorConstants.m101Pearl;

  @override
  Widget build(BuildContext context) {
    ColorType? colorType = Provider.of<ColorTypeProvider>(context).colorType;

    if (colorType != null) {
      switch (colorType) {
        case ColorType.Single:
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
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
                        setState(() {
                          singleColor = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const ComponentWidget()
            ],
          );
        case ColorType.Double:
          return Column(
            children: [
              Row(
                children: [
                  Text(
                    'Body Color :',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  ColorCircle(
                    color: doubleBodyColor,
                    colors: ColorConstants.proTones,
                    onColorSelected: (value) {
                      setState(() {
                        doubleBodyColor = value;
                      });
                    },
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
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  ColorCircle(
                    color: doubleFrameColor,
                    colors: ColorConstants.proTones,
                    onColorSelected: (value) {
                      setState(() {
                        doubleFrameColor = value;
                      });
                    },
                  ),
                ],
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
                      setState(() {
                        metallicColor = value;
                      });
                    },
                  ),
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
