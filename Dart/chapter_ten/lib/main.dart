void main(List<String> args) {
  final alphabet = 'abcdefghijklmnopqrstuvwxyz';
  final intList = <int> [0,5,9,11,26];
  final stringBuffer = StringBuffer();
  for (final letter in intList){
      stringBuffer.write(alphabet[letter]);
  }
  print(stringBuffer);
}