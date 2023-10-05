import 'dart:async';

void main(List<String> args) {
  print("Before the future");
  // using Future with then, onValue and onError
  Future<int>.delayed(
    Duration(seconds: 1),
    () => 42,
  ).then(
    (value) => print(value),
    onError: (error){
      print(error);
    }
  );
  print("After the future");
}
