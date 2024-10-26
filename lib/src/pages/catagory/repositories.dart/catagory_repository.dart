import 'package:http/http.dart' as http;
import 'package:either_dart/either.dart';
import 'dart:convert';
import '../../../infrastructure/common/url_repository.dart';
import '../models/catagory_model.dart';
import '../../add_catagory/models/add_catagory_dto.dart';

class CatagoryRepository {
  Future<Either<String, List<CatagoryModel>>?> getCatagories() async {
    final url = UrlRepository.catagories;
    http.Response response = await http.get(url);

    try {
      List<dynamic> result = json.decode(response.body);
      List<CatagoryModel> models = result
          .map((model) =>
              CatagoryModel.fromJson(json: model as Map<String, dynamic>))
          .toList();
      return Right(models);
    } catch (e) {
      return Left(e.toString());
    }
  }

  // Future<dynamic>? getTotal(List<dynamic> ids) async {
  //   final url = UrlRepository.items;
  //   http.Response response = await http.get(url);

  //   try {
  //     num sum = 0;
  //     List<dynamic> result = json.decode(response.body);
  //     for (Map<String, dynamic> item in result) {
  //       if (ids.contains(item["id"])) {
  //         sum += item["price"];
  //       }
  //     }
  //     return sum;
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
