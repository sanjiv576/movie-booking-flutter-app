import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/router/app_route.dart';
import '../../../../core/common/widget/toast_message.dart';
import '../../domain/entity/booking_entity.dart';
import '../../domain/use_case/booking_use_case.dart';
import '../state/booking_state.dart';

final bookingViewModelProvider =
    StateNotifierProvider<BookingViewModel, BookingState>(
  (ref) => BookingViewModel(
    ref.read(bookingUseCaseProvider),
  ),
);

class BookingViewModel extends StateNotifier<BookingState> {
  final BookingUseCase bookingUsecase;
  BookingViewModel(this.bookingUsecase) : super(BookingState.initial()) {
    getAllBookings();
  }

  Future<void> createReservation(
      BuildContext context, String movieId, BookingEntity booking) async {
    state.copyWith(isLoading: true);
    var data = await bookingUsecase.createReservation(movieId, booking);

    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);

        showAlertMessage(
            context: context, description: l.error, title: 'Error');
      },
      (r) {
        state = state.copyWith(isLoading: false, error: null);
        showToastMessage(message: 'Booked successfully');
        Navigator.pushNamed(context, AppRoute.homeRoute);
      },
    );
  }

  Future<void> getAllBookings() async {
    state = state.copyWith(isLoading: true);
    var data = await bookingUsecase.getAllBookings();

    data.fold((l) {
      state.copyWith(isLoading: false, error: l.error);
      showToastMessage(message: l.error);
    }, (r) {
      state = state.copyWith(isLoading: false, error: null, allBookings: r);
    });
  }
}
