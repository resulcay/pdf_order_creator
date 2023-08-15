// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MailServiceProvider extends ChangeNotifier {
  String? clientName;

  MailServiceProvider({
    this.clientName,
  });
  bool isLoading = false;

  Future sendMail(
      String clientName, Uint8List attachment, BuildContext context) async {
    isLoading = true;
    notifyListeners();
    const serviceId = 'service_2uz9i6c';
    const templateId = 'template_one6hqt';
    const userId = 'zJ5ApQSA5f7OfmuyJ';

    var url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    try {
      DateTime sentDate = DateTime.now();
      var response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'service_id': serviceId,
            'template_id': templateId,
            'user_id': userId,
            'template_params': {
              'sent_date': sentDate.toString(),
              'client_name': clientName,
            }
          }));

      if (response.statusCode == 200) {
        isLoading = false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(context.locale == const Locale("en")
                ? "Successfully Sent"
                : "Und seight"),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(context.locale == const Locale("en")
                ? "Sending Failed due to an unknown reason. Please retry again later."
                : "Errorrr seight"),
          ),
        );
      }
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }
}
