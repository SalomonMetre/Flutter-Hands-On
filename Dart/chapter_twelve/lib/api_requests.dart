import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Todo {
  final int id, userId;
  final String title;
  final bool completed;

  Todo(
      {required this.id,
      required this.userId,
      required this.title,
      required this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json["id"] as int,
      userId: json["id"] as int,
      title: json["title"] as String,
      completed: json["completed"] as bool,
    );
  }

  @override
  String toString() =>
      "id : $id <--> userId : $userId <--> title : $title <--> completed : $completed";
}

void main(List<String> args) async {
  try {
    final httpResponse = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos/"));
    if(httpResponse.statusCode != 200){
      throw HttpException("Http exception of type : ${httpResponse.statusCode}");
    }
    final jsonDecoded = json.decode(httpResponse.body);
    for (final todo in jsonDecoded) {
      print(Todo.fromJson(todo));
    }
  } on SocketException catch (exception) {
    print(exception.message);
  } on HttpException catch (exception) {
    print(exception.message);
  }
}
