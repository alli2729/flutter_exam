import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import '../../../infrastructure/common/url_repository.dart';
import '../models/item_model.dart';

class TitleRepository {
  Future<Either<String, List<ItemModel>>?> getItems(
      {required int categoryId}) async {
    try {
      List<ItemModel> items = [];
      final url = UrlRepository.items;
      final http.Response response = await http.get(url);
      final List<dynamic> result = json.decode(response.body);
      for (Map<String, dynamic> item in result) {
        if (item["categoryId"] == categoryId) {
          items.add(ItemModel.fromJason(item));
        }
      }

      return Right(items);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>?> removeItem({required int itemId}) async {
    try {
      final url = UrlRepository.itemsById(itemId: itemId);
      final http.Response response = await http.delete(url);
      if (response.statusCode != 200) return const Left('cannot delete');
      return const Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, Map<String, dynamic>>?> getCategoryById(
      {required int id}) async {
    try {
      final url = UrlRepository.categoryById(categoryId: id);
      final http.Response response = await http.get(url);
      final Map<String, dynamic> category = json.decode(response.body);
      return Right(category);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
