import 'package:http/http.dart' as http;
import 'package:either_dart/either.dart';
import 'dart:convert';
import '../../../infrastructure/common/url_repository.dart';
import '../models/category_model.dart';

class CatagoryRepository {
  Future<Either<String, List<CategoryModel>>?> getCategories() async {
    try {
      List<CategoryModel> categories = [];
      final url = UrlRepository.categories;
      http.Response response = await http.get(url);
      List<dynamic> result = json.decode(response.body);

      for (Map<String, dynamic> category in result) {
        categories.add(CategoryModel.fromJson(json: category));
      }
      return Right(categories);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
