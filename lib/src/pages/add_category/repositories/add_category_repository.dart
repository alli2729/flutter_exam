import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import '../../../infrastructure/common/url_repository.dart';
import '../models/add_category_dto.dart';

class AddCategoryRepository {
  Future<Either<String, Map<String, dynamic>>?> addCetagory(
      {required AddCategoryDto dto}) async {
    try {
      final url = UrlRepository.categories;
      http.Response response = await http.post(
        url,
        body: json.encode(dto),
        headers: {"Content-Type": "application/json"},
      );
      final Map<String, dynamic> result = json.decode(response.body);
      if (response.statusCode == 201) {
        return Right(result);
      }
      return const Left('Error');
    } catch (e) {
      return Left(e.toString());
    }
  }
}
