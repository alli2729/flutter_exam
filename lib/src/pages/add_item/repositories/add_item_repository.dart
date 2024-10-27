import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import '../../../infrastructure/common/url_repository.dart';
import '../models/add_catagory_dto.dart';
import '../models/add_item_dto.dart';

class AddItemRepository {
  Future<Either<String, Map<String, dynamic>>?> addItemToItems({
    required AddItemDto itemDto,
  }) async {
    try {
      final url = UrlRepository.items;
      final http.Response response = await http.post(
        url,
        body: json.encode(itemDto.toJson()),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode != 201) return const Left("cannot add item");
      final Map<String, dynamic> result = json.decode(response.body);

      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, Map<String, dynamic>>?> getCatagory(
      {required int catagoryId}) async {
    try {
      final url = UrlRepository.catagoryById(catagoryId: catagoryId);
      final http.Response response = await http.get(url);
      final Map<String, dynamic> result = json.decode(response.body);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>?> addItemToCatagory({
    required AddCatagoryDto catagoryDto,
    required int catagoryId,
  }) async {
    try {
      final url = UrlRepository.catagoryById(catagoryId: catagoryId);
      final http.Response response = await http.patch(
        url,
        body: json.encode(catagoryDto.toJson()),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        return const Right(true);
      }
      return const Left("cannot add item to catagory");
    } catch (e) {
      return Left(e.toString());
    }
  }
}
