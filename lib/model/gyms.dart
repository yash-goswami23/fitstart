// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:fitstart/core/assets/app_assets.dart';

List<Gym> gyms = [
  Gym(
    name: "Gold's Gym",
    location: "Indra Puram",
    rating: 4,
    price: "1200",
    url: AppAssets.gymimgUrl4,
  ),
  Gym(
    name: "Fitness 52 Gym",
    location: "Gizor Road Noida",
    rating: 2,
    price: "3000",
    url: AppAssets.gymimgUrl3,
  ),
  Gym(
    name: "Talwalkars Gym",
    location: "Noida's Sector-62",
    rating: 5,
    price: "1500",
    url: AppAssets.gymimgUrl2,
  ),
  Gym(
    name: "Anytime Fitness Gym",
    location: "Noida's Sector-48",
    rating: 2,
    price: "900",
    url: AppAssets.gymimgUrl1,
  ),
  Gym(
    name: "La Fitnesse",
    location: " Sector-18, Noida",
    rating: 3,
    price: "1999",
    url: AppAssets.gymimgUrl3,
  ),
  Gym(
    name: "Cult",
    location: "Sector 18",
    rating: 4,
    price: "1199",
    url: AppAssets.gymimgUrl1,
  ),
];

class Gym {
  String name;
  String location;
  int rating;
  String price;
  String url;
  Gym({
    required this.name,
    required this.location,
    required this.rating,
    required this.price,
    required this.url,
  });

  Gym copyWith({String? name, String? lcoation, int? rating, String? price}) {
    return Gym(
      name: name ?? this.name,
      location: lcoation ?? this.location,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      url: url ?? this.url,
    );
  }
}
