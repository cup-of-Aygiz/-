import 'package:flutter/cupertino.dart';

class Pers {
  int id;
  String name, status, species, gender, origin, location, image;

  Pers(
    this.id, {
    this.name,
    this.status,
    this.species,
    this.gender,
    this.origin,
    this.location,
    this.image,
  });

  Pers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? 'not known';
    status = json['status'] ?? 'not known';
    species = json['species'] ?? 'not known';
    gender = json['gender'] ?? 'not known';
    if (json['origin'] != null) {
      origin = json['origin']['name'] ?? 'not known';
    } else {
      origin = 'not known';
    }
    if (json['location'] != null) {
      location = json['location']['name'] ?? 'not known';
    } else {
      location = 'not known';
    }
    image = json['image'];
  }
}

List<Pers> persons = [
  Pers(
    1,
    name: "Rick Sanchez",
    status: "Alive",
    species: "Human",
    gender: "Male",
    origin: "Earth (C-137)",
    location: "Earth (Replacement Dimension)",
    image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
  ),
  Pers(
    2,
    name: "Morty Smith",
    status: "Alive",
    species: "Human",
    gender: "Male",
    origin: "Earth (C-137)",
    location: "Earth (Replacement Dimension)",
    image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
  ),
  Pers(
    3,
    name: "Summer Smith",
    status: "Alive",
    species: "Human",
    gender: "Female",
    origin: "Earth (C-137)",
    location: "Earth (Replacement Dimension)",
    image: "https://rickandmortyapi.com/api/character/avatar/3.jpeg",
  ),
  Pers(
    4,
    name: "Beth Smith",
    status: "Death",
    species: "Human",
    gender: "Female",
    origin: "Earth (C-137)",
    location: "Earth (Replacement Dimension)",
    image: "https://rickandmortyapi.com/api/character/avatar/4.jpeg",
  ),
];
