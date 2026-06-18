/// Base class for all app exceptions
class AppException implements Exception {
  final String message;
  final String? prefix;

  AppException([this.message = 'Something went wrong', this.prefix]);

  @override
  String toString() {
    return prefix == null ? message : '$prefix: $message';
  }
}