import 'dart:convert';

import 'package:study1/model/chartec.dart';
import 'package:http/http.dart' as http;

class RickAndMortyApi {
  static Future<List<Pers>> getPers() async {
    List<Pers> result = [];
    for (int i = 1; i <= 5; i++) {
      result.addAll(await getPage(i));
    }
    return result;
  }

  static Future<List<Pers>> getPage(int page) async {
    var response = await http.get(
      'https://rickandmortyapi.com/api/character/?page=$page',
      headers: {
        'Content-Type': 'application/json',
      },
    );
    RickAndMortyResponse results =
        RickAndMortyResponse.fromJson(jsonDecode(response.body));
    return results.results;
  }

  static Future<List<Pers>> findByName(String name) async {
    var response = await http.get(
      'https://rickandmortyapi.com/api/character/?name=$name',
      headers: {
        'Content-Type': 'application/json',
      },
    );
    RickAndMortyResponse results =
        RickAndMortyResponse.fromJson(jsonDecode(response.body));
    return results.results;
  }
}

class RickAndMortyResponse {
  List<Pers> results;

  RickAndMortyResponse({this.results});

  RickAndMortyResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = new List<Pers>();
      json['results'].forEach((v) {
        results.add(new Pers.fromJson(v));
      });
    }
  }
}
