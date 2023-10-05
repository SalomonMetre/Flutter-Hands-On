enum HTTPStatusCode {
  found("successful", 200),
  notfound("failed", 404);

  final String meaning;
  final int code;
  const HTTPStatusCode(this.meaning, this.code);
}

void main(List<String> args) {
  final found = HTTPStatusCode.found;
  print("${found.name} [Code : ${found.code}, Meaning : ${found.meaning}]");
}