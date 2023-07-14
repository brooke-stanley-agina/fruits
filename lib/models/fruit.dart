import 'dart:convert';
import 'package:http/http.dart' as http;

class Fruit {
  final int? id;
  final String? title;
  final String? imageUrl;
  final String? quantity;

  Fruit(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.quantity});

  factory Fruit.fromMap(Map<String, dynamic> json) {
    return Fruit(
        id: json['id'],
        title: json['title'],
        imageUrl: json['imageUrl'],
        quantity: json['quantity']);
  }

  factory Fruit.fromJson(Map<String, dynamic> json) {
    return Fruit(
        id: json['id'],
        title: json['title'],
        imageUrl: json['imageUrl'],
        quantity: json['quantity']);
  }
}

List<Fruit> decodeFruit(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Fruit>((json) => Fruit.fromMap(json)).toList();
}

Future<List<Fruit>> fetchFruit() async {
  final response =
      await http.get(Uri.parse("https://037e-102-68-78-161.ngrok-free.app"));
  if (response.statusCode == 200) {
    print("Data has peen returned");
    return decodeFruit(response.body);
  } else {
    throw Exception("Unable to retrieve data from the api");
  }
}
