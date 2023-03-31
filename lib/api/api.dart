import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nytimes_cloudium/models/most_popular.dart';

Future<MostPopular> fetchResults() async {
  final response = await http.get(Uri.parse(
      'https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=IkeVPfvhvQhbGwyyCQ5obgcjrJVp2nsa'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return MostPopular.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Users');
  }
}
