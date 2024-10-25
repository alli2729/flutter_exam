import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import '../../../infrastructure/common/url_repository.dart';

class LoginRepository {
  Future<Either<String, bool>?> login({
    required String name,
    required String password,
  }) async {
    try {
      final url = UrlRepository.users;
      final http.Response response = await http.get(url);
      final List<dynamic> users = json.decode(response.body);

      if (users.any((user) => user["name"] == name)) {
        for (Map<String, dynamic> user in users) {
          if (user["name"] == name) {
            Map<String, dynamic> foundedUser = user;
            if (foundedUser["password"] == password) {
              return const Right(true);
            } else {
              return const Left('Password is not correct');
            }
          }
        }
      } else {
        return const Left('User not found');
      }
    } catch (e) {
      return Left(e.toString());
    }
    return null;
  }
}
