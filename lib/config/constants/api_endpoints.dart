class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://10.0.2.2:3000/";
  // static const String baseUrl = "http://192.168.18.24:3000/";

  static const String login = "users/login";
  static const String register = "users/register";

  static const String createMoview = "movies";
  static const String getAllMovies = "movies";

  static const String getSingleMovie = "movies/";
  static const String updateSingleMovie = "movies/";
  static const String deleteSingleMovie = "movies/";

  static const String getAllReservations = "reservations";
  // reservations/:movieId
  static const String createReservation = "reservations/";
  // reservations/movies/:reservationId
  static const String updateReservation = "reservations/movies/";
  static const String deleteReservation = "reservations/movies/";
}
