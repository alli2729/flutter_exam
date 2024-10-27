import 'package:http/http.dart' as http;
import 'package:either_dart/either.dart';
import 'dart:convert';
import '../../../infrastructure/common/url_repository.dart';
import '../models/catagory_model.dart';

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
}
