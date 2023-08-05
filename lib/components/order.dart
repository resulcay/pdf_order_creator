// ignore_for_file: prefer_const_constructors

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfprefix;
import 'package:printing/printing.dart';

class PDFView extends StatefulWidget {
  const PDFView({
    Key? key,
  }) : super(key: key);

  @override
  State<PDFView> createState() => _PDFViewState();
}

class _PDFViewState extends State<PDFView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        build: (format) => _createPdf(
          format,
        ),
      ),
    );
  }

  Future<Uint8List> _createPdf(
    PdfPageFormat format,
  ) async {
    final pdf = pdfprefix.Document(
      version: PdfVersion.pdf_1_5,
      compress: true,
    );
    pdf.addPage(
      pdfprefix.Page(
        pageFormat: PdfPageFormat((80 * (72.0 / 25.4)), 600,
            marginAll: 5 * (72.0 / 25.4)),
        build: (context) {
          return pdfprefix.SizedBox(
            width: double.infinity,
            child: pdfprefix.FittedBox(
                child: pdfprefix.Column(
                    mainAxisAlignment: pdfprefix.MainAxisAlignment.start,
                    children: [
                  pdfprefix.Text("Follow",
                      style: pdfprefix.TextStyle(
                          fontSize: 35, fontWeight: pdfprefix.FontWeight.bold)),
                  pdfprefix.Container(
                    width: 250,
                    height: 1.5,
                    margin: pdfprefix.EdgeInsets.symmetric(vertical: 5),
                    color: PdfColors.black,
                  ),
                  pdfprefix.Container(
                    width: 300,
                    child: pdfprefix.Text("#30FlutterTips",
                        style: pdfprefix.TextStyle(
                          fontSize: 35,
                          fontWeight: pdfprefix.FontWeight.bold,
                        ),
                        textAlign: pdfprefix.TextAlign.center,
                        maxLines: 5),
                  ),
                  pdfprefix.Container(
                    width: 250,
                    height: 1.5,
                    margin: pdfprefix.EdgeInsets.symmetric(vertical: 10),
                    color: PdfColors.black,
                  ),
                  pdfprefix.Text("Hayri Canı",
                      style: pdfprefix.TextStyle(
                          fontSize: 25, fontWeight: pdfprefix.FontWeight.bold)),
                  pdfprefix.Text("Follow on Medium, LinkedIn, GitHub",
                      style: pdfprefix.TextStyle(
                          fontSize: 25, fontWeight: pdfprefix.FontWeight.bold)),
                ])),
          );
        },
      ),
    );
    return pdf.save();
  }
}
