import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdf_order_creator/service/path_service.dart';

class LanguageButton extends StatelessWidget {
  final Locale locale;
  final String path;
  final BuildContext ctx;
  const LanguageButton({
    super.key,
    required this.locale,
    required this.path,
    required this.ctx,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ctx.setLocale(locale),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: 30,
          width: 40,
          child: SvgPicture.asset(PathService.imagePathProvider('$path.svg')),
        ),
      ),
    );
  }
}
