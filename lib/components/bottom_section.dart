import 'package:flutter/material.dart';
import 'package:pdf_order_creator/components/order.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => const PDFView())),
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
