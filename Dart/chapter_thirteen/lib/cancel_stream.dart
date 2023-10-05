import 'dart:async';
import 'dart:io';

void main(List<String> args) async {
  int dataCounter = 0;
  final file = File("chapter_thirteen/assets/text.txt");
  StreamSubscription<List<int>>? streamSubscription;
  streamSubscription = file.openRead().listen(
    (data) {
      dataCounter++;
      print(data.length);
      if(dataCounter == 5){
        streamSubscription?.cancel();
      }
    },
    cancelOnError: true,
  );
}
