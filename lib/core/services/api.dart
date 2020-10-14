import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:segue_as_normas_app/core/models/place.dart';
import 'package:segue_as_normas_app/core/models/review.dart';

const String SERVER_URL = 'http://192.168.1.16:3001/api/v1';

class Api {
  Dio dio = new Dio();

  ///buscar todos os lugares
  Future<List<Place>> getAllPlaces() async {
    try {
      var url = '$SERVER_URL/places/';
      var headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      var places = new List<Place>();

      final Response response = await dio.get(
        url,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          },
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        for (var place in response.data) {
          places.add(Place.fromJson(place));
        }
        return places;
      } else {
        return List.empty();
      }
    } catch (e) {
      // print(e.toString());
      return List.empty();
    }
  }

  ///pesquisar um lugar pelo nome enviado como parametro
  Future<List<Place>> getSearchPlaces(String name) async {
    try {
      var url = '$SERVER_URL/places/?name=$name';
      var headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      var places = new List<Place>();

      final Response response = await dio.get(
        url,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          },
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        for (var place in response.data) {
          places.add(Place.fromJson(place));
        }
        return places;
      } else {
        return List.empty();
      }
    } catch (e) {
      // print(e.toString());
      return List.empty();
    }
  }

  /// buscar todos lugares de uma categoria enviada como parametro
  Future<List<Place>> getPlacesCategoty(String category) async {
    try {
      var url = '$SERVER_URL/places/?categoty=$category';
      var headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      var places = new List<Place>();

      final Response response = await dio.get(
        url,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          },
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        for (var place in response.data) {
          places.add(Place.fromJson(place));
        }
        return places;
      } else {
        return List.empty();
      }
    } catch (e) {
      // print(e.toString());
      return List.empty();
    }
  }

  ///Buscar os comentarios de um lugar enviando o id como parametro
  Future<List<Review>> getReviewsPlaces(String placeId) async {
    try {
      var url = '$SERVER_URL/places/$placeId/reviews';
      var headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      var reviews = new List<Review>();

      final Response response = await dio.get(
        url,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          },
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        for (var review in response.data['reviews']) {
          reviews.add(Review.fromJson(review));
        }
        return reviews;
      } else {
        return List.empty();
      }
    } catch (e) {
      return List.empty();
    }
  }

  ///Adicionar um comentario enviando o nome,email,titulo e o comentario como parametro
  Future<bool> addPlaceComment({
    String placeId,
    String name,
    String email,
    String title,
    String comment,
  }) async {
    try {
      var url = '$SERVER_URL/places/$placeId/reviews';

      var headers = {'Content-Type': 'application/json; charset=UTF-8'};
      var formData = jsonEncode(<String, dynamic>{
        "review": {
          'reviewer_name': name,
          'reviewer_email': email,
          'title': title,
          'comments': comment
        },
      });

      final Response response = await dio.post(
        url,
        data: formData,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          },
          headers: headers,
        ),
      );

      return (response.statusCode == 202) ? true : false;
    } catch (e) {
      // print(e);
      return false;
    }
  }

  ///Adicionar a avaliação de um lugar enviando o id e as notas como parametro
  Future<bool> addPlaceScore(
      {String placeId,
      double cleanScore,
      double maskScore,
      double distScore}) async {
    try {
      var url = '$SERVER_URL/places/$placeId/reviewsScore';

      var headers = {'Content-Type': 'application/json; charset=UTF-8'};
      var formData = jsonEncode(<String, dynamic>{
        'sanitization': cleanScore,
        'wearing_mask': maskScore,
        'social_distancing': distScore,
      });

      final Response response = await dio.post(
        url,
        data: formData,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          },
          headers: headers,
        ),
      );

      return (response.statusCode == 202) ? true : false;
    } catch (e) {
      // print(e);
      return false;
    }
  }

  ///FAKE API para testes
  Future<bool> _fakeApiTest(int timer) {
    return Future.delayed(Duration(seconds: timer)).then((onValue) => false);
  }
}
