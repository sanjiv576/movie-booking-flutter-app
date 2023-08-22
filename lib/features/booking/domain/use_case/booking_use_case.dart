import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_ticket_booking/features/booking/domain/entity/booking_entity.dart';

import '../../../../core/failure/failure.dart';
import '../repository/booking_repository.dart';

final bookingUseCaseProvider =
    Provider((ref) => BookingUseCase(ref.read(bookingRepositoryProvider)));

class BookingUseCase {
  final IBookingRepository _repository;
  BookingUseCase(this._repository);

  Future<Either<Failure, bool>> createReservation(
      String movieId, BookingEntity bookingEntity) {
    return _repository.createReservation(movieId, bookingEntity);
  }

  Future<Either<Failure, List<BookingEntity>>> getAllBookings() {
    return _repository.getAllBookings();
  }
}
