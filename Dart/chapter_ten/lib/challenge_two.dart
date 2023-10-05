class InvalidPostalCodeException implements Exception {
  final String message;
  InvalidPostalCodeException(this.message);

  @override
  String toString() => message;
}

class InvalidPostalCode{
  static bool isCodeValid({String code=""}){
      final checker = RegExp(r'^[0-9]{5}$');
      if (!checker.hasMatch(code)){
        throw InvalidPostalCodeException("Error : Code should be made of 5 digits");
      }
      return true;
  }
}

void main(List<String> args) {
  final String myCode = "12345kms";
  try{
    if(InvalidPostalCode.isCodeValid(code: myCode)){
      print("Code is valid");
    }
  }
  on InvalidPostalCodeException catch (exception){
    print(exception);
  }
}