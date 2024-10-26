class UrlRepository {
  UrlRepository._();

  static const String _baseUrl = 'localhost:3000';
  static const String _users = '/users';
  static const String _catagories = '/catagories';
  static const String _items = '/items';

  static Uri users = Uri.http(_baseUrl, _users);
  static Uri catagories = Uri.http(_baseUrl, _catagories);
  static Uri items = Uri.http(_baseUrl, _items);

  static Uri catagoryById({required int catagoryId}) {
    return Uri.http(_baseUrl, '$_catagories/$catagoryId');
  }

  static Uri itemsById({required int itemId}) {
    return Uri.http(_baseUrl, '$_items/$itemId');
  }
}
