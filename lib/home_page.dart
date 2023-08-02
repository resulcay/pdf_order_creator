import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdf_order_creator/constants/locale_constants.dart';
import 'package:pdf_order_creator/localization/locale_keys.g.dart';
import 'package:pdf_order_creator/service/path_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.setLocale(LocaleConstants.trLocale),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 40,
                  width: 100,
                  child:
                      SvgPicture.asset(PathService.imagePathProvider('tr.svg')),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => context.setLocale(LocaleConstants.deLocale),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 40,
                  width: 100,
                  child:
                      SvgPicture.asset(PathService.imagePathProvider('de.svg')),
                ),
              ),
            ),
            Text(
              LocaleKeys.language.tr(),
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
