import 'package:segue_as_normas_app/core/models/review.dart';
import 'package:segue_as_normas_app/core/models/reviews_score.dart';

class Place {
  Location location;
  ReviewsScore reviewsScore;
  List<String> secondaryImagens;
  String sId;
  String name;
  String category;
  String shortDescription;
  String description;
  String primaryImagem;
  OperatingHours operatingHours;
  Address address;
  int numberOfReviews;
  List<Review> reviews;
  String createdAt;
  String updatedAt;

  Place(
      {this.location,
      this.reviewsScore,
      this.secondaryImagens,
      this.sId,
      this.name,
      this.category,
      this.shortDescription,
      this.description,
      this.primaryImagem,
      this.operatingHours,
      this.address,
      this.numberOfReviews,
      this.reviews,
      this.createdAt,
      this.updatedAt});

  Place.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    reviewsScore = json['reviews_score'] != null
        ? new ReviewsScore.fromJson(json['reviews_score'])
        : null;
    secondaryImagens = json['secondary_imagens'].cast<String>();
    sId = json['_id'];
    name = json['name'];
    category = json['category'];
    shortDescription = json['short_description'];
    description = json['description'];
    primaryImagem = json['primary_imagem'];
    operatingHours = json['operating_hours'] != null
        ? new OperatingHours.fromJson(json['operating_hours'])
        : null;
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    numberOfReviews = json['number_of_reviews'];
    if (json['reviews'] != null) {
      reviews = new List<Review>();
      json['reviews'].forEach((v) {
        reviews.add(new Review.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.reviewsScore != null) {
      data['reviews_score'] = this.reviewsScore.toJson();
    }
    data['secondary_imagens'] = this.secondaryImagens;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['category'] = this.category;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['primary_imagem'] = this.primaryImagem;
    if (this.operatingHours != null) {
      data['operating_hours'] = this.operatingHours.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    data['number_of_reviews'] = this.numberOfReviews;
    if (this.reviews != null) {
      data['reviews'] = this.reviews.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Location {
  List<double> coordinates;
  String type;

  Location({this.coordinates, this.type});

  Location.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'].cast<double>();
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coordinates'] = this.coordinates;
    data['type'] = this.type;
    return data;
  }
}

class OperatingHours {
  String segundaFeira;
  String tercaFeira;
  String quartaFeira;
  String quintaFeira;
  String sextaFeira;
  String sabado;
  String domingo;

  OperatingHours(
      {this.segundaFeira,
      this.tercaFeira,
      this.quartaFeira,
      this.quintaFeira,
      this.sextaFeira,
      this.sabado,
      this.domingo});

  OperatingHours.fromJson(Map<String, dynamic> json) {
    segundaFeira = json['segunda-feira'];
    tercaFeira = json['terça-feira'];
    quartaFeira = json['quarta-feira'];
    quintaFeira = json['quinta-feira'];
    sextaFeira = json['sexta-feira'];
    sabado = json['sabado'];
    domingo = json['domingo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['segunda-feira'] = this.segundaFeira;
    data['terça-feira'] = this.tercaFeira;
    data['quarta-feira'] = this.quartaFeira;
    data['quinta-feira'] = this.quintaFeira;
    data['sexta-feira'] = this.sextaFeira;
    data['sabado'] = this.sabado;
    data['domingo'] = this.domingo;
    return data;
  }
}

class Address {
  String street;
  String number;
  String complement;
  String city;
  String state;
  String neighborhood;
  String zipCode;

  Address(
      {this.street,
      this.number,
      this.complement,
      this.city,
      this.state,
      this.neighborhood,
      this.zipCode});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    number = json['number'];
    complement = json['complement'];
    city = json['city'];
    state = json['state'];
    neighborhood = json['neighborhood'];
    zipCode = json['zip_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['number'] = this.number;
    data['complement'] = this.complement;
    data['city'] = this.city;
    data['state'] = this.state;
    data['neighborhood'] = this.neighborhood;
    data['zip_code'] = this.zipCode;
    return data;
  }
}
