class UrlRepository {
  UrlRepository._();

  static const String _baseUri = 'localhost:3000';
  static const String _users = '/users';
  static Uri users = Uri.http(_baseUri, _users);
}
