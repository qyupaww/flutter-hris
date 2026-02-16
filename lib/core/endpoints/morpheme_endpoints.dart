abstract class MorphemeEndpoints {
  static Uri _createUriBaseUrl(String path) =>
      Uri.parse('${const String.fromEnvironment('BASE_URL')}$path');

  static Uri login = _createUriBaseUrl('/api/v1/auth/login');
  static Uri register = _createUriBaseUrl('/api/v1/auth/register');
  static Uri listCompany = _createUriBaseUrl('/api/v1/companies');
  static Uri logout = _createUriBaseUrl('/api/v1/auth/logout');
}
