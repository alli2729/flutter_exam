import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:exam/src/pages/title/models/catagory_dto.dart';
import '../../../infrastructure/common/url_repository.dart';
import '../models/items_model.dart';
import 'package:http/http.dart' as http;

class TitleRepository {
  Future<Either<String, List<ItemModel>>?> getItems({required List ids}) async {
    List<ItemModel> items = [];
    final url = UrlRepository.items;
    final http.Response response = await http.get(url);

    try {
      final List<dynamic> result = json.decode(response.body);
      for (Map<String, dynamic> item in result) {
        if (ids.contains(item["id"])) {
          items.add(ItemModel.fromJason(item));
        }
      }

      return Right(items);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>?> removeItem(
      {required CatagoryDto dto, required int id}) async {
    final url = UrlRepository.catagoryById(catagoryId: id);
    final http.Response response = await http.patch(
      url,
      body: json.encode(dto.toJason()),
      headers: {"Content-Type": "application/json"},
    );

    try {
      if (response.statusCode != 200) {
        return const Left('cannot delete');
      }
      return const Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
