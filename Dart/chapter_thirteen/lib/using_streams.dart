import 'dart:io';

void main(List<String> args) async {
  final file = File("chapter_thirteen/assets/text.txt");
  final stream = file.openRead();

  // using listen method
  // stream.listen((data) {
  //   print("Stream chunk length : ${data.length}");
  // });

  // using await-for
  try {
    await for (final data in stream) {
      print("Stream chunk length using await-for: ${data.length}");
    }
  } on Exception catch (error) {
    print(error);
  } finally {
    print('All finished');
  }
}
