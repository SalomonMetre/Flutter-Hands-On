import 'dart:convert';
import 'package:http/http.dart' as http;

class Comment{
  final int postId, id;
  final String name, email, body;

  Comment({
    required this.postId, 
    required this.id,
    required this.name,
    required this.email,
    required this.body,  
  });

  /// creating a Comment object from json
  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    postId : json["postId"] as int,
    id: json["id"] as int,
    name: json["name"] as String,
    email: json["email"] as String,
    body: json["body"] as String,
  );

  @override
  String toString() => "$postId .. $id .. $email .. $name .. $body";
}

void main(List<String> args) async {
  // getting json string
  final httpResponse = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
  final jsonString = httpResponse.body;
  final decodedJson = json.decode(jsonString);
  final commentList = decodedJson.map((comment) => Comment.fromJson(comment));
  commentList.forEach(print);
}