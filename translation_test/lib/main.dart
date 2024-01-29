import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:simplytranslate/simplytranslate.dart';

Future<Map<String, dynamic>> query(Map<String, dynamic> payload) async {
  const apiUrl =
      "https://api-inference.huggingface.co/models/SalomonMetre13/nnd_fr_mt_v3";
  final headers = {
    "Authorization": "Bearer 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",
    "Content-Type": "application/json",
  };

  final response = await http.post(Uri.parse(apiUrl),
      headers: headers, body: json.encode(payload));
  if (response.statusCode == 200) {
    final decodedBody = json.decode(response.body);
    return decodedBody[0];
  } else {
    throw Exception('Request failed with status: ${response.statusCode}');
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final payload = {
    "inputs": "wanathasyaminya ekiro ekyotwasunganamomo ?",
  };
  final output = await query(payload);
  final translationText = output['translation_text'] as String;
  Logger().i(translationText);

  ///use Libretranslate
  ///use Google Translate
  final gt = SimplyTranslator(EngineType.google);
  final lt = SimplyTranslator(EngineType.libre);
  gt.setInstance = "simplytranslate.pussthecat.org";

  ///using Libretranslate
  ///only text translation avaliable
  ///short form to only get translated text as String, also shorter code:
  final textResult = await lt.trSimply(translationText, "de", 'fr');
  Logger().i(textResult);
}
