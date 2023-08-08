import 'package:flutter/material.dart';
import 'package:pdf_order_creator/components/color_type_provider.dart';
import 'package:pdf_order_creator/components/model_provider.dart';
import 'package:pdf_order_creator/components/order.dart';
import 'package:pdf_order_creator/enums/color_type_enum.dart';
import 'package:pdf_order_creator/enums/model_enum.dart';
import 'package:pdf_order_creator/models/component_model.dart';
import 'package:provider/provider.dart';

class BottomSection extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController surname;
  final TextEditingController email;
  final TextEditingController phone;
  final TextEditingController address;
  final GlobalKey<FormState> formKey;
  const BottomSection({
    super.key,
    required this.formKey,
    required this.name,
    required this.surname,
    required this.email,
    required this.phone,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    Model model = Provider.of<ModelProvider>(context).model;
    ColorType? colorType = Provider.of<ColorTypeProvider>(context).colorType;

    return OutlinedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const PDFView()));
        if (formKey.currentState!.validate()) {
          if (model != Model.none) {
            if (colorType != null) {
              List<Component> components = [];
              if (model == Model.wildDrop) {
                components = Component.wildDropExtra
                    .where((element) => element.isSelected == true)
                    .toList();

                switch (colorType) {
                  case ColorType.Single:
                    components.insert(
                        0,
                        Component(
                          'no code',
                          'Single Color',
                          'SINGLE COLOR EXTERIOR BODY',
                          '0',
                          true,
                        ));
                    break;
                  case ColorType.Double:
                    components.insert(
                        0,
                        Component(
                          'DRP-ORO-07',
                          'Double Color',
                          'DUAL COLOR EXTERIOR BODY',
                          '799',
                          true,
                        ));
                    break;
                  case ColorType.Metallic:
                    components.insert(
                        0,
                        Component(
                          'DRP-ORO-20',
                          'Color',
                          'METALLIC SPECIAL COLOR',
                          '1750',
                          true,
                        ));
                    break;
                  default:
                }
              } else {
                components = Component.widenDropExtra
                    .where((element) => element.isSelected == true)
                    .toList();
              }

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PDFView()));
            } else {
              print('select color type');
            }
          } else {
            print('select model');
          }
        } else {
          print('error occurred');
        }
      },
      child: const Padding(
        padding: EdgeInsets.all(15),
        child: Icon(
          Icons.chevron_right,
          size: 30,
        ),
      ),
    );
  }
}
