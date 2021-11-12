import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final String access, refresh, error;

  User({required this.access, required this.refresh, required this.error});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        access: json['access'], refresh: json['refresh'], error: "None");
  }
}

Future<List<Event>> events() async {
  final resp = await http.get(
      Uri.parse('https://backaand.herokuapp.com/Event/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });

  if (resp.statusCode == 200) {
    List<dynamic> body = jsonDecode(resp.body);
    List<Event> event = body.map((dynamic e) => Event.fromJson(e)).toList();

    return event;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load Events.');
  }
}

class Event {
  final String title, subtitle, description, date, time, photo;

  Event(
      {required this.title,
      required this.subtitle,
      required this.description,
      required this.date,
      required this.time,
      required this.photo});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      photo: json['photo'] as String,
    );
  }
}

Future<User> login(String email, String pwd) async {
  // print("Login");
  final resp = await http.post(
    Uri.parse('https://backaand.herokuapp.com/api/token/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "email": email,
      "password": pwd,
    }),
  );
  // print(jsonDecode(resp.body)['access']);
  if (resp.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(resp.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    // print(resp.body);
    return User(
        access: "access",
        refresh: "refresh",
        error: jsonDecode(resp.body)['detail']);
  }
}
