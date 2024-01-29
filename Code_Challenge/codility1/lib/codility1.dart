int solution(String S) {
  int length = S.length;
  int lengthOps = length - 1;
  int count = S.substring(0, 1) == S.substring(length - 1, length) ? 1 : 0;
  final listChars = S.split("");
  for (int i = 0; i < lengthOps; i++) {
    final removedChar = listChars.removeAt(0);
    listChars.add(removedChar);
    if (listChars[0] == listChars[length - 1]) {
      count++;
    }
  }
  return count;
}

void main(List<String> args) {
  print(solution("abab"));
}
