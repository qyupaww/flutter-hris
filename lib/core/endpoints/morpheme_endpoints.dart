abstract class MorphemeEndpoints {
  static Uri _createUriBaseUrl(String path) =>
      Uri.parse('${const String.fromEnvironment('BASE_URL')}$path');

  static Uri login = _createUriBaseUrl('/api/v1/auth/login');
  static Uri logout = _createUriBaseUrl('/api/v1/auth/logout');
  static Uri register = _createUriBaseUrl('/api/v1/auth/register');
  static Uri listCompany = _createUriBaseUrl('/api/v1/companies');
  static Uri companyDetail(int id) =>
      _createUriBaseUrl('/api/v1/companies/$id');
  static Uri uploadImage = _createUriBaseUrl('/api/v1/utils/upload');
  static Uri checkIn = _createUriBaseUrl('/api/v1/attendance/check-in');
  static Uri checkOut = _createUriBaseUrl('/api/v1/attendance/check-out');
  static Uri attendanceToday = _createUriBaseUrl('/api/v1/attendance/today');
}
