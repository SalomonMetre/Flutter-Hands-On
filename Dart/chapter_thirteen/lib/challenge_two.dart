import 'dart:async';
import 'dart:math';

class CoinFlippingService {
  final streamController = StreamController<String>();
  final Random randGen = Random();
  final int numberOfFlips;
  CoinFlippingService({required this.numberOfFlips});
  Stream<String> get onFlip => streamController.stream;
  void start() async {
    final sink = streamController.sink;
    for (int i = 0; i < numberOfFlips; i++) {
      await Future.delayed(Duration(milliseconds: 500));
      if (randGen.nextBool()) {
        sink.add("Tails");
      } else {
        sink.add("Heads");
      }
    }
  }
}
void main(List<String> args) {
  final coinFlipper = CoinFlippingService(numberOfFlips: 10);
  coinFlipper.onFlip.listen((coin) {
    print(coin);
  });
  coinFlipper.start();
}
