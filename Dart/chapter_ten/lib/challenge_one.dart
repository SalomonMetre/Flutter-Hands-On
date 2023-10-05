extension on List<String>{
  List<double> get parsed{
    var newList = <double>[];
    for(var element in this){
      try{
        newList.add(double.parse(element));
      }
      on FormatException catch (e){
        print("Error : ${e.message}");
      }
    }
    return newList;
  }
}

void main(List<String> args) {
  final numbers = ['3', '1E+8', '1.25', 'four', '-0.01', 'NaN', 'Infinity'];
  final newList = numbers.parsed;
  newList.forEach(print);
}