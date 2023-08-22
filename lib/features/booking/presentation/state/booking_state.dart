import '../../domain/entity/booking_entity.dart';

class BookingState {
  final bool isLoading;
  final String? error;
  final List<BookingEntity> allBookings;

  const BookingState({
    required this.isLoading,
    required this.error,
    required this.allBookings,
  });

  factory BookingState.initial() => const BookingState(
        isLoading: false,
        error: null,
        allBookings: [],
      );

  BookingState copyWith({
    bool? isLoading,
    String? error,
    List<BookingEntity>? allBookings,
  }) {
    return BookingState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      allBookings: allBookings ?? this.allBookings,
    );
  }
}
