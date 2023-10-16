import 'dart:convert';

import 'package:http/http.dart' as http;

void main(List<String> args) async {
  final url = Uri.parse("https://google.com");
  final client = http.Client();
  final request = http.Request("GET", url);
  final response = await client.send(request);
  final stream = response.stream.asBroadcastStream();

  //viewing content as text
  final textStream = stream.transform(utf8.decoder);
  textStream.listen(
    (text) {
      print("Text : $text");
    },
    onDone: () => print("Done"),
    onError: (error) => print(error),
  );

  // viewing content as encoded text into lists of numbers
  final numbersStream = stream;
  numbersStream.listen(
    (listNumbers) {
      print("List : $listNumbers and length : ${listNumbers.length}");
    },
    onDone: () => print("Done"),
    onError: (error) => print(error),
  );

  // viewing content as encoded text into lists of numbers in binary
  final bitsStream = stream;
  bitsStream.listen(
    (listNumbers) {
      final stringBuffer = StringBuffer();
      listNumbers.forEach((element) {
        stringBuffer.write(element.toRadixString(2));
        stringBuffer.write(" ");
      });
      print(stringBuffer);
      stringBuffer.clear();
    },
    onDone: () => print("Done"),
    onError: (error) => print(error),
  );
}
