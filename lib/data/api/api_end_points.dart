class ApiEndpoints {
  /// Basic auth endpoints
  static const String splash = 'api/splash';
  static const String checkUser = 'api/checkuser';
  static const String uploadFile = 'api/upload-file';

  /// User endpoints
  static const String user = 'api/user';
  static const String userLogin = '$user/login';

  /// Partner endpoints
  static const String partner = 'api/partner';
  static const String partnerLogin = '$partner/login';

  /// Post endpoints
  static const String post = 'api/post';

  /// Report endpoints
  static const String report = 'api/report';
}
