import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pdf_order_creator/components/color_name_provider.dart';
import 'package:pdf_order_creator/components/color_type_provider.dart';
import 'package:pdf_order_creator/components/model_provider.dart';
import 'package:pdf_order_creator/components/order.dart';
import 'package:pdf_order_creator/enums/color_type_enum.dart';
import 'package:pdf_order_creator/enums/model_enum.dart';
import 'package:pdf_order_creator/localization/locale_keys.g.dart';
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
    String normalColorName =
        Provider.of<ColorNameProvider>(context).normalColorName;
    String doubleBodyColorName =
        Provider.of<ColorNameProvider>(context).doubleBodyColorName;
    String doubleFrameColorName =
        Provider.of<ColorNameProvider>(context).doubleFrameColorName;
    String metallicColorName =
        Provider.of<ColorNameProvider>(context).metallicColorName;

    return OutlinedButton(
      onPressed: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => const PDFView()));
        if (formKey.currentState!.validate()) {
          if (model != Model.none) {
            if (colorType != null) {
              List<Component> components = [];
              if (model == Model.wildDrop) {
                components = Component.wildDropExtra;

                switch (colorType) {
                  case ColorType.Single:
                    Component component = Component(
                      LocaleKeys.noCode.tr(),
                      LocaleKeys.singleColor.tr(),
                      '${LocaleKeys.singleColor.tr().toUpperCase()} ${LocaleKeys.exterior.tr()}($normalColorName)',
                      '0',
                      true,
                    );
                    if (!components.contains(component)) {
                      components.insert(0, component);
                    }

                    break;
                  case ColorType.Double:
                    Component component = Component(
                      'DRP-ORO-07',
                      LocaleKeys.doubleColor.tr(),
                      '${LocaleKeys.dualExterior.tr()}(Body: $doubleBodyColorName,Frame: $doubleFrameColorName)',
                      '799',
                      true,
                    );
                    if (!components.contains(component)) {
                      components.insert(0, component);
                    }
                    break;
                  case ColorType.Metallic:
                    Component component = Component(
                      'DRP-ORO-20',
                      LocaleKeys.color.tr(),
                      '${LocaleKeys.metallicSpecial.tr()}($metallicColorName)',
                      '1750',
                      true,
                    );
                    if (!components.contains(component)) {
                      components.insert(0, component);
                    }

                    break;
                  default:
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PDFView(
                              name: name.text,
                              surname: surname.text,
                              phone: phone.text,
                              address: address.text,
                              email: email.text,
                              caravanType: 'WILD',
                              extraComponentList: components,
                              standardComponentList: Component.wildDropStandard,
                              standartTotalPrice: '16080,75',
                            )));
              } else {
                components = Component.widenDropExtra;
                switch (colorType) {
                  case ColorType.Single:
                    Component component = Component(
                      LocaleKeys.noCode.tr(),
                      LocaleKeys.singleColor.tr(),
                      '${LocaleKeys.singleColor.tr().toUpperCase()} ${LocaleKeys.exterior.tr()}($normalColorName)',
                      '0',
                      true,
                    );
                    if (!components.contains(component)) {
                      components.insert(0, component);
                    }

                    break;
                  case ColorType.Double:
                    Component component = Component(
                      'DRP-MO-1207',
                      LocaleKeys.doubleColor.tr(),
                      '${LocaleKeys.dualExterior.tr()}(Body: $doubleBodyColorName,Frame: $doubleFrameColorName)',
                      '799',
                      true,
                    );
                    if (!components.contains(component)) {
                      components.insert(0, component);
                    }
                    break;
                  case ColorType.Metallic:
                    Component component = Component(
                      'DRP-MO-1220',
                      LocaleKeys.color.tr(),
                      '${LocaleKeys.metallicSpecial.tr()}($metallicColorName)',
                      '1750',
                      true,
                    );
                    if (!components.contains(component)) {
                      components.insert(0, component);
                    }

                    break;
                  default:
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PDFView(
                              name: name.text,
                              surname: surname.text,
                              phone: phone.text,
                              address: address.text,
                              email: email.text,
                              caravanType: 'WIDEN',
                              extraComponentList: Component.widenDropExtra,
                              standardComponentList:
                                  Component.widenDropStandard,
                              standartTotalPrice: '20737,50',
                            )));
              }
            } else {
              Flushbar(
                backgroundColor: Theme.of(context).highlightColor,
                message: LocaleKeys.selectColorType.tr(),
                duration: const Duration(seconds: 2),
              ).show(context);
            }
          } else {
            Flushbar(
              backgroundColor: Theme.of(context).highlightColor,
              message: LocaleKeys.pleaseSelectModel.tr(),
              duration: const Duration(seconds: 2),
            ).show(context);
          }
        } else {
          Flushbar(
            backgroundColor: Theme.of(context).highlightColor,
            message: LocaleKeys.field.tr(),
            duration: const Duration(seconds: 2),
          ).show(context);
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
