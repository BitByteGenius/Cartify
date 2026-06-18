class TFormatException implements Exception {
  final String message;

  TFormatException([this.message = 'Invalid data format received']);

  @override
  String toString() => message;
}