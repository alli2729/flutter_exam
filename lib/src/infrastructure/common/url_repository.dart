class UrlRepository {
  UrlRepository._();

  static const String _baseUrl = 'localhost:3000';
  static const String _users = '/users';
  static const String _categories = '/categories';
  static const String _items = '/items';

  static Uri users = Uri.http(_baseUrl, _users);
  static Uri categories = Uri.http(_baseUrl, _categories);
  static Uri items = Uri.http(_baseUrl, _items);

  static Uri categoryById({required int categoryId}) {
    return Uri.http(_baseUrl, '$_categories/$categoryId');
  }

  static Uri itemsById({required int itemId}) {
    return Uri.http(_baseUrl, '$_items/$itemId');
  }
}
