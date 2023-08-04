import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pdf_order_creator/components/invoice.dart';
import 'package:pdf_order_creator/constants/locale_constants.dart';
import 'package:pdf_order_creator/localization/locale_keys.g.dart';
import 'package:pdf_order_creator/service/theme_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        LocaleConstants.enLocale,
        LocaleConstants.deLocale,
      ],
      path: LocaleConstants.TRANSLATION_PATH,
      fallbackLocale: LocaleConstants.enLocale,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateTitle: (context) => LocaleKeys.title.tr(),
      theme: ThemeService.themeConfiguration(context),
      //  home: const HomePage(),
      home: const PDFView(),
    );
  }
}
