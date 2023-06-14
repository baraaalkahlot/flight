/// all endpoint api
abstract class ApiPath {
  ApiPath._();

  static const _liveDomain = 'https://api.ihub2.com';
  static const _baseUrl = '$_liveDomain/api';

  static const flights = '$_baseUrl/flights/search';

}
