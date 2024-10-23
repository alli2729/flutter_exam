import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import '../../../infrastructure/common/url_repository.dart';

class LoginRepository {
  Future<Either<String, bool>?> login(String name, String pass) async {
    try {
      final url = UrlRepository.users;
      final http.Response response = await http.get(url);
      final List<dynamic> users = json.decode(response.body);

      String? userName;

      if (!(users.any((user) {
        final bool userExists = user['name'] == name;
        if (userExists) {
          userName = user["name"];
        }

        return userExists;
      }))) {
        return const Left('User Not Found');
      }

      for (int i = 0; i < users.length; i++) {
        if (users[i]["pass"] == pass) {
          return const Right(true);
        }
      }
      return const Left('User Not Found');
    } catch (e) {
      return Left(e.toString());
    }
  }
}
