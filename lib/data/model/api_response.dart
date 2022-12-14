class ApiResponse<T> {
  /// Model for api response
  ApiResponse({
    required this.statusCode,
    this.body,
    this.error = false,
    this.errorMessage = 'Something went wrong!',
  });

  T? body;
  bool error;
  String errorMessage;
  int statusCode;
}
