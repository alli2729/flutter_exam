import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import '../models/edit_item_dto.dart';
import '../../../infrastructure/common/url_repository.dart';

class EditItemRepository {
  Future<Either<String, Map<String, dynamic>>?> findItem(
      {required int id}) async {
    try {
      final url = UrlRepository.itemsById(itemId: id);
      final http.Response response = await http.get(url);
      final Map<String, dynamic> result = json.decode(response.body);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>?> editItem({
    required EditItemDto dto,
    required int id,
  }) async {
    try {
      final url = UrlRepository.itemsById(itemId: id);
      final http.Response response = await http.patch(
        url,
        body: json.encode(dto.toJson()),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode != 200) return const Left('Cannot edit');
      return const Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
