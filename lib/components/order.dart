// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdf;
import 'package:printing/printing.dart';

import 'package:pdf_order_creator/models/component_model.dart';

class PDFView extends StatefulWidget {
  final String name;
  final String surname;
  final String email;
  final String phone;
  final String address;
  final String standartTotalPrice;
  final String caravanType;
  final List<Component> standardComponentList;
  final List<Component> extraComponentList;
  const PDFView({
    Key? key,
    required this.name,
    required this.surname,
    required this.email,
    required this.phone,
    required this.address,
    required this.standartTotalPrice,
    required this.caravanType,
    required this.standardComponentList,
    required this.extraComponentList,
  }) : super(key: key);

  @override
  State<PDFView> createState() => _PDFViewState();
}

class _PDFViewState extends State<PDFView> {
  late String dateTime;
  @override
  void initState() {
    DateTime now = DateTime.now();
    dateTime = DateFormat('yyyy-MM-dd hh:mm:ss').format(now);
    super.initState();
  }

  @override
  void dispose() {
    widget.extraComponentList.removeAt(0);
    super.dispose();
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
    final document = pdf.Document(
      version: PdfVersion.pdf_1_5,
      compress: true,
    );
    final font = await PdfGoogleFonts.sansitaRegular();
    document.addPage(
      pdf.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pdf.SizedBox(
            child: pdf.FittedBox(
                child: pdf.Column(children: [
              pdf.SizedBox(
                width: 210 * PdfPageFormat.mm,
                height: 297 * PdfPageFormat.mm,
                child: pdf.Container(
                  decoration: pdf.BoxDecoration(
                    borderRadius: pdf.BorderRadius.circular(10),
                    border: pdf.Border.all(
                      width: 1,
                    ),
                  ),
                  child: pdf.Column(
                    children: [
                      pdf.Center(
                        child: pdf.Padding(
                          padding: pdf.EdgeInsets.all(5),
                          child: pdf.SizedBox(
                            width: 110 * PdfPageFormat.mm,
                            child: pdf.Text(
                                textAlign: pdf.TextAlign.center,
                                style: pdf.TextStyle(font: font, fontSize: 22),
                                '''Producer: DROP CAMP KARAVAN LTD. ŞTİ. DROP CAMP WILD DROP AKSARAY-TÜRKİYE Tel: +90 382 3330003  Fax: +90 382 3330004 info@drop-camp.com'''),
                          ),
                        ),
                      ),
                      pdf.Table(border: pdf.TableBorder.all(), children: [
                        pdf.TableRow(children: [
                          pdf.Padding(
                              padding: pdf.EdgeInsets.only(left: 5, top: 20),
                              child: pdf.Text('Customer Information',
                                  style:
                                      pdf.TextStyle(font: font, fontSize: 20))),
                          pdf.Padding(
                              padding: pdf.EdgeInsets.only(left: 5),
                              child: pdf.Text('''
Date: $dateTime
Order Number: xxx-xxx-xxx
Customer Number: aaa-aaa-aaa
''', style: pdf.TextStyle(font: font, fontSize: 20))),
                        ]),
                      ]),
                      pdf.Table(border: pdf.TableBorder.all(), children: [
                        pdf.TableRow(children: [
                          pdf.Padding(
                              padding: pdf.EdgeInsets.only(left: 5),
                              child: pdf.Text(
                                  '${widget.name} ${widget.surname}',
                                  style:
                                      pdf.TextStyle(font: font, fontSize: 16))),
                          pdf.Padding(
                              padding: pdf.EdgeInsets.only(left: 5),
                              child: pdf.Text(widget.phone,
                                  style:
                                      pdf.TextStyle(font: font, fontSize: 16))),
                        ]),
                      ]),
                      pdf.Table(border: pdf.TableBorder.all(), children: [
                        pdf.TableRow(children: [
                          pdf.Padding(
                              padding: pdf.EdgeInsets.only(left: 5),
                              child: pdf.Text(widget.address,
                                  style:
                                      pdf.TextStyle(font: font, fontSize: 16))),
                          pdf.Padding(
                              padding: pdf.EdgeInsets.only(left: 5),
                              child: pdf.Text(widget.email,
                                  style:
                                      pdf.TextStyle(font: font, fontSize: 16))),
                        ]),
                      ]),
                      pdf.SizedBox(
                          height: 35,
                          child: pdf.Center(
                              child: pdf.Text(
                                  'DropCamp ${widget.caravanType} DROP STANDARD EQUIPMENTS',
                                  style: pdf.TextStyle(
                                      font: font, fontSize: 22)))),
                      pdf.Table(border: pdf.TableBorder.all(), children: [
                        pdf.TableRow(repeat: true, children: [
                          pdf.SizedBox(
                              width: 30 * PdfPageFormat.mm,
                              child: pdf.Center(
                                child: pdf.Text('Number',
                                    style: pdf.TextStyle(
                                        font: font, fontSize: 15)),
                              )),
                          pdf.SizedBox(
                              width: 45 * PdfPageFormat.mm,
                              child: pdf.Center(
                                child: pdf.Text('Product/Service',
                                    style: pdf.TextStyle(
                                        font: font, fontSize: 15)),
                              )),
                          pdf.SizedBox(
                              width: 105 * PdfPageFormat.mm,
                              child: pdf.Center(
                                child: pdf.Text('Definition',
                                    style: pdf.TextStyle(
                                        font: font, fontSize: 15)),
                              )),
                          pdf.SizedBox(
                              width: 25 * PdfPageFormat.mm,
                              child: pdf.Center(
                                child: pdf.Text('Unit Price',
                                    style: pdf.TextStyle(
                                        font: font, fontSize: 15)),
                              )),
                        ])
                      ]),
                      pdf.Column(children: [
                        pdf.Table(
                            border: pdf.TableBorder.all(),
                            children: List.generate(
                                widget.standardComponentList.length,
                                (index) =>
                                    pdf.TableRow(repeat: true, children: [
                                      pdf.SizedBox(
                                          width: 30 * PdfPageFormat.mm,
                                          child: pdf.Center(
                                            child: pdf.Text(
                                                widget
                                                    .standardComponentList[
                                                        index]
                                                    .code,
                                                style: pdf.TextStyle(
                                                    font: font, fontSize: 13)),
                                          )),
                                      pdf.SizedBox(
                                          width: 45 * PdfPageFormat.mm,
                                          child: pdf.Center(
                                            child: pdf.Text(
                                                widget
                                                    .standardComponentList[
                                                        index]
                                                    .name,
                                                style: pdf.TextStyle(
                                                    font: font, fontSize: 13)),
                                          )),
                                      pdf.SizedBox(
                                          width: 105 * PdfPageFormat.mm,
                                          child: pdf.Center(
                                            child: pdf.Text(
                                                widget
                                                    .standardComponentList[
                                                        index]
                                                    .description,
                                                style: pdf.TextStyle(
                                                    font: font, fontSize: 11)),
                                          )),
                                      pdf.SizedBox(
                                          width: 25 * PdfPageFormat.mm,
                                          child: pdf.Center(
                                            child: pdf.Text('0 €',
                                                style: pdf.TextStyle(
                                                    font: font, fontSize: 15)),
                                          )),
                                    ])))
                      ]),
                      pdf.Table(border: pdf.TableBorder.all(), children: [
                        pdf.TableRow(repeat: false, children: [
                          pdf.SizedBox(
                              width: 185 * PdfPageFormat.mm,
                              child: pdf.Center(
                                child: pdf.Text('TOTAL',
                                    style: pdf.TextStyle(
                                        font: font, fontSize: 15)),
                              )),
                          pdf.SizedBox(
                              width: 25 * PdfPageFormat.mm,
                              child: pdf.Center(
                                child: pdf.Text(
                                    '${widget.standartTotalPrice} €',
                                    style: pdf.TextStyle(
                                        font: font, fontSize: 13)),
                              )),
                        ])
                      ]),
                    ],
                  ),
                ),
              ),
            ])),
          );
        },
      ),
    );
    document.addPage(
      pdf.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          int totalPrice = 0;
          List<Component> selectedComponents = widget.extraComponentList
              .where((e) => e.isSelected == true)
              .toList();

          if (selectedComponents.isNotEmpty) {
            totalPrice = selectedComponents
                .map((e) => int.parse(e.price))
                .reduce((value, element) => value + element);
          }

          return pdf.SizedBox(
            child: pdf.FittedBox(
                child: pdf.Column(children: [
              pdf.SizedBox(
                width: 210 * PdfPageFormat.mm,
                height: 297 * PdfPageFormat.mm,
                child: pdf.Container(
                  decoration: pdf.BoxDecoration(
                    borderRadius: pdf.BorderRadius.circular(10),
                    border: pdf.Border.all(
                      width: 1,
                    ),
                  ),
                  child: pdf.Column(
                    children: [
                      pdf.SizedBox(
                          height: 35,
                          child: pdf.Center(
                              child: pdf.Text(
                                  'DropCamp ${widget.caravanType} DROP EXTRA EQUIPMENTS',
                                  style: pdf.TextStyle(
                                      font: font, fontSize: 22)))),
                      pdf.Table(border: pdf.TableBorder.all(), children: [
                        pdf.TableRow(repeat: true, children: [
                          pdf.SizedBox(
                              width: 30 * PdfPageFormat.mm,
                              child: pdf.Center(
                                child: pdf.Text('Number',
                                    style: pdf.TextStyle(
                                        font: font, fontSize: 15)),
                              )),
                          pdf.SizedBox(
                              width: 45 * PdfPageFormat.mm,
                              child: pdf.Center(
                                child: pdf.Text('Product/Service',
                                    style: pdf.TextStyle(
                                        font: font, fontSize: 15)),
                              )),
                          pdf.SizedBox(
                              width: 105 * PdfPageFormat.mm,
                              child: pdf.Center(
                                child: pdf.Text('Definition',
                                    style: pdf.TextStyle(
                                        font: font, fontSize: 15)),
                              )),
                          pdf.SizedBox(
                              width: 25 * PdfPageFormat.mm,
                              child: pdf.Center(
                                child: pdf.Text('Unit Price',
                                    style: pdf.TextStyle(
                                        font: font, fontSize: 15)),
                              )),
                        ])
                      ]),
                      pdf.Column(children: [
                        pdf.Table(
                            border: pdf.TableBorder.all(),
                            children: List.generate(
                                selectedComponents.length,
                                (index) =>
                                    pdf.TableRow(repeat: true, children: [
                                      pdf.SizedBox(
                                          width: 30 * PdfPageFormat.mm,
                                          child: pdf.Center(
                                            child: pdf.Text(
                                                selectedComponents[index].code,
                                                style: pdf.TextStyle(
                                                    font: font, fontSize: 13)),
                                          )),
                                      pdf.SizedBox(
                                          width: 45 * PdfPageFormat.mm,
                                          child: pdf.Center(
                                            child: pdf.Text(
                                                selectedComponents[index].name,
                                                style: pdf.TextStyle(
                                                    font: font, fontSize: 13)),
                                          )),
                                      pdf.SizedBox(
                                          width: 105 * PdfPageFormat.mm,
                                          child: pdf.Center(
                                            child: pdf.Text(
                                                selectedComponents[index]
                                                    .description,
                                                style: pdf.TextStyle(
                                                    font: font, fontSize: 11)),
                                          )),
                                      pdf.SizedBox(
                                        width: 25 * PdfPageFormat.mm,
                                        child: pdf.Center(
                                            child: pdf.Text(
                                                '${selectedComponents[index].price},00 €',
                                                style: pdf.TextStyle(
                                                    font: font, fontSize: 12))),
                                      ),
                                    ])))
                      ]),
                      pdf.Table(border: pdf.TableBorder.all(), children: [
                        pdf.TableRow(repeat: false, children: [
                          pdf.SizedBox(
                              width: 185 * PdfPageFormat.mm,
                              child: pdf.Center(
                                child: pdf.Text('TOTAL',
                                    style: pdf.TextStyle(
                                        font: font, fontSize: 15)),
                              )),
                          pdf.SizedBox(
                              width: 25 * PdfPageFormat.mm,
                              child: pdf.Center(
                                  child: pdf.Text('$totalPrice €',
                                      style: pdf.TextStyle(
                                          font: font, fontSize: 13)))),
                        ])
                      ]),
                    ],
                  ),
                ),
              ),
            ])),
          );
        },
      ),
    );

    return document.save();
  }
}
