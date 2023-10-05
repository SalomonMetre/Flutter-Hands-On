import 'dart:io';
import 'dart:convert';

void main(List<String> args) async {
  final file = File("chapter_thirteen/assets/text.txt");
  final textStream = file.openRead();
  final stringStream = textStream.transform(utf8.decoder);
  await for(final text in stringStream){
    print(text);
  }
}