import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../data/data_sources/booking_remote_data_source.dart';
import '../../data/repository/booking_remote_repo_impl.dart';
import '../entity/booking_entity.dart';

final bookingRepositoryProvider = Provider(
    (ref) => BookingRemoteRepoImpl(ref.read(bookingRemoteDataSourceProvider)));

abstract class IBookingRepository {
  Future<Either<Failure, bool>> createReservation(
      String movieId, BookingEntity bookingEntity);

  Future<Either<Failure, List<BookingEntity>>> getAllBookings();
}
