class ApiEndPoints {
  // base url
  static const String baseUrl = "http://192.168.43.99:3000/";
  static const String tokenValid = "tokenIsValid";

  //users
  static const String signup = "signup";
  static const String signin = "signin";
  static const String changePassword = "ChangePassword";
  static const String userProfile = "user_profile";
  static const String updateProfile = "update_profile";
  static const String addAddress = "add_address";
  static const String updateAddress = "update_address";
  static const String deleteAddress = "delete_address";
  static const String wallet = "wallet";
  static const String transaction = "wallet/transaction";
  static const String rating = "rating";
  static const String categories = "get_categories";

  //service provider
  static const String serviceProviderProfile = "service_provider/user_profile";
  static const String updateServiceProviderProfile =
      "service_provider/update_profile";
  static const String getAllServiceProvider = "service_providers";
  static const String getMyRatings = "get_ratings";

  //admin
  static const String addCategory = "add_category";
}
