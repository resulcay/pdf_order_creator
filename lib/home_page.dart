import 'package:flutter/material.dart';
import 'package:pdf_order_creator/components/animated_textfield.dart';
import 'package:pdf_order_creator/components/bottom_section.dart';
import 'package:pdf_order_creator/components/language_button.dart';
import 'package:pdf_order_creator/components/model_provider.dart';
import 'package:pdf_order_creator/components/toggle_button.dart';
import 'package:pdf_order_creator/components/widen_drop_widget.dart';
import 'package:pdf_order_creator/components/wild_drop_widget.dart';
import 'package:pdf_order_creator/constants/locale_constants.dart';
import 'package:pdf_order_creator/enums/model_enum.dart';
import 'package:pdf_order_creator/service/path_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController surnameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    List<bool> myItems = [false, false];

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Transform.translate(
                          offset: const Offset(-20, 0),
                          child: Image.asset(
                              height: 50,
                              PathService.imagePathProvider('caravan.png')),
                        ),
                      ),
                      const Spacer(),
                      LanguageButton(
                        locale: LocaleConstants.enLocale,
                        path: 'gb',
                        ctx: context,
                      ),
                      LanguageButton(
                        locale: LocaleConstants.deLocale,
                        path: 'de',
                        ctx: context,
                      ),
                    ],
                  ),
                  AnimatedTextField(
                    label: "Name",
                    textController: nameController,
                  ),
                  AnimatedTextField(
                    label: "Surname",
                    textController: surnameController,
                  ),
                  AnimatedTextField(
                    label: "E-mail",
                    textController: emailController,
                  ),
                  AnimatedTextField(
                    label: "Phone Number",
                    textController: phoneController,
                  ),
                  AnimatedTextField(
                    label: "Address",
                    textController: addressController,
                    maxLines: 4,
                  ),
                  const SizedBox(height: 20),
                  ToggleButton(myItems: myItems),
                  const SizedBox(height: 20),
                  Consumer<ModelProvider>(
                    builder: (context, value, child) {
                      switch (value.model) {
                        case Model.none:
                          return const Text(
                            'Please Select Model!',
                            style: TextStyle(fontSize: 17),
                          );
                        case Model.wildDrop:
                          return const WildDropWidget();
                        case Model.widenDrop:
                          return const WidenDropWidget();
                        default:
                          return const SizedBox.shrink();
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  const BottomSection()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
