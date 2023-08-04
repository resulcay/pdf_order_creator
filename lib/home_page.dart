import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pdf_order_creator/components/animated_textfield.dart';
import 'package:pdf_order_creator/components/language_button.dart';
import 'package:pdf_order_creator/components/toggle_button.dart';
import 'package:pdf_order_creator/constants/locale_constants.dart';
import 'package:pdf_order_creator/localization/locale_keys.g.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  const AnimatedTextField(label: "Name"),
                  const AnimatedTextField(label: "Surname"),
                  const AnimatedTextField(label: "E-mail"),
                  const AnimatedTextField(label: "Phone Number"),
                  const AnimatedTextField(
                    label: "Address",
                    maxLines: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      LocaleKeys.language.tr(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const ToggleButton(),
                  const SizedBox(height: 200),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
