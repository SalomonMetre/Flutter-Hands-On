import 'dart:mirrors';

class Student {
  Student(this.name);
  String name;

  @override
  String toString() {
    return "Name : $name";
  }
}

void main(List<String> args) {
  final newStudent = Student("Initial Name");
  final instanceMirror = reflect(newStudent);
  print(instanceMirror.getField(Symbol("name")));
  instanceMirror.setField(Symbol("name"), "New Name");
  print(newStudent);
}
