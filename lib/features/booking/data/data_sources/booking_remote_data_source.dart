import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_ticket_booking/core/shared_prefs/user_shared_prefs.dart';
import 'package:movie_ticket_booking/features/booking/domain/entity/booking_entity.dart';

import '../../../../config/constants/api_endpoints.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';

final bookingRemoteDataSourceProvider =
    Provider((ref) => BookingRemoteDataSource(
          ref.read(httpServiceProvider),
          ref.read(userSharedPrefsProvider),
        ));

class BookingRemoteDataSource {
  final Dio _dio;
  final UserSharedPrefs _userSharedPrefs;

  BookingRemoteDataSource(this._dio, this._userSharedPrefs);

  // create booking

  Future<Either<Failure, bool>> createBooking(
      String movieId, BookingEntity booking) async {
    try {
      String? token;

      var data = await _userSharedPrefs.getToken();
      data.fold((l) => token = null, (r) => token = r!);
      var response = await _dio.post(
        ApiEndpoints.createReservation + movieId,
        // data: booking.toJson(),
        data: {
          'movieName': booking.movieName,
          'date': booking.date,
          'time': booking.time,
          // 'seatNumber': booking.seatNumber.map((e) => e.seat).toList(),
          'seatNumber': booking.seatNumber,
          'charge': booking.charge,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data['error'].toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

  // fetch all bookings
  Future<Either<Failure, List<BookingEntity>>> getAllBookings() async {
    try {
      String? token;

      var data = await _userSharedPrefs.getToken();
      data.fold((l) => token = null, (r) => token = r!);
      var response = await _dio.get(
        ApiEndpoints.getAllReservations,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        // convert JSON to object
        List<BookingEntity> bookingList = (response.data as List<dynamic>)
            .map<BookingEntity>((json) => BookingEntity.fromJson(json))
            .toList();

        print('Bookings fetched successfully.');
        // print(bookingList);
        return Right(bookingList);
      } else {
        return Left(
          Failure(
            error: response.data['error'].toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }
}
