import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/booking_entity.dart';
import '../../domain/repository/booking_repository.dart';
import '../data_sources/booking_remote_data_source.dart';

class BookingRemoteRepoImpl implements IBookingRepository {
  final BookingRemoteDataSource _remoteDataSource;
  BookingRemoteRepoImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, bool>> createReservation(
      String movieId, BookingEntity booking) {
    return _remoteDataSource.createBooking(movieId, booking);
  }

  @override
  Future<Either<Failure, List<BookingEntity>>> getAllBookings() {
    return _remoteDataSource.getAllBookings();
  }
}
