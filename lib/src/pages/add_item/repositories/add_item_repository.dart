import 'package:either_dart/either.dart';

import '../../../infrastructure/common/url_repository.dart';
import 'package:http/http.dart' as http;

import '../models/add_item_dto.dart';

class AddItemRepository {
  Future<Either<String, bool>?> addItem({
    required AddItemDto dto,
    required int catagoyId,
  }) async {
    final url = UrlRepository.items;
    final http.Response response = await http.post(
      url,
      body: dto.toJson(),
      headers: {
        "Content-Type": "application/json",
      },
    );
    try {
      if (response.statusCode != 201) return const Left("cannot add item");
    } catch (e) {}
  }
}
