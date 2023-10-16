import 'dart:math';

Stream<int> threeRandomNumbers() async* {
  final randGen = Random();
  for (int i = 0; i < 3; i++) {
    await Future.delayed(const Duration(seconds: 2));
    yield randGen.nextInt(10);
  }
}

void main(List<String> args) async {
  await for (final value in threeRandomNumbers()) {
    print(value);
  }
}
