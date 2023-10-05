import 'dart:io';

void main(List<String> args) async {
  final file = File("chapter_thirteen/assets/text.txt");
  final content = await file.readAsString();
  print(" Content using await : $content\n");

  // reading the content synchronously
  final synchContent = file.readAsStringSync();
  print(" Content processed synchronously : $synchContent");
}