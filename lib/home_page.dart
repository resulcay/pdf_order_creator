import 'package:flutter/material.dart';
import 'package:pdf_order_creator/components/animated_textfield.dart';
import 'package:pdf_order_creator/components/language_button.dart';
import 'package:pdf_order_creator/components/model_provider.dart';
import 'package:pdf_order_creator/components/order.dart';
import 'package:pdf_order_creator/components/toggle_button.dart';
import 'package:pdf_order_creator/constants/locale_constants.dart';
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
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  color: Theme.of(context).highlightColor,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Optional Components',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                              const SelectBox(
                                  componentName: 'Component A',
                                  description:
                                      'Some definite expressions here to be more clear Some definite expressions here to be more ',
                                  imagePath: 'wild drop.png'),
                              const SelectBox(
                                  componentName: 'Component B',
                                  description:
                                      'Some definite expressions here to be more clear Some definite expressions here to be more ',
                                  imagePath: 'wild drop.png'),
                              const SelectBox(
                                  componentName: 'Component C',
                                  description:
                                      'Some definite expressions here to be more clear Some definite expressions here to be more ',
                                  imagePath: 'wild drop.png'),
                            ],
                          );
                        case Model.widenDrop:
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  color: Theme.of(context).highlightColor,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Optional Components',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                              const SelectBox(
                                  componentName: 'Component A',
                                  description:
                                      'Some definite expressions here to be more clear Some definite expressions here to be more ',
                                  imagePath: 'widen drop.png'),
                              const SelectBox(
                                  componentName: 'Component B',
                                  description:
                                      'Some definite expressions here to be more clear Some definite expressions here to be more ',
                                  imagePath: 'widen drop.png'),
                              const SelectBox(
                                  componentName: 'Component C',
                                  description:
                                      'Some definite expressions here to be more clear Some definite expressions here to be more ',
                                  imagePath: 'widen drop.png'),
                            ],
                          );
                        default:
                          return const SizedBox.shrink();
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PDFView())),
                      child: const Padding(
                        padding: EdgeInsets.all(15),
                        child: Icon(
                          Icons.chevron_right,
                          size: 30,
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum Model { none, wildDrop, widenDrop }

class SelectBox extends StatefulWidget {
  final String imagePath;
  final String componentName;
  final String description;
  const SelectBox(
      {super.key,
      required this.imagePath,
      required this.componentName,
      required this.description});

  @override
  State<SelectBox> createState() => _SelectBoxState();
}

class _SelectBoxState extends State<SelectBox> {
  bool selection = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: selection,
      onChanged: (value) {
        setState(() {
          if (value != null) {
            selection = value;
          }
        });
      },
      title: SizedBox(
        height: 150,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                    height: 100,
                    alignment: Alignment.centerLeft,
                    PathService.imagePathProvider(widget.imagePath)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.componentName),
                )
              ],
            ),
            Flexible(
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8),
                  child: Text(widget.description),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
