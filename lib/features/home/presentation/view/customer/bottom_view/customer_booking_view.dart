import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_ticket_booking/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:movie_ticket_booking/features/booking/presentation/viewmodel/booking_viewmodel.dart';

import '../../../../../../config/router/app_route.dart';

class CustomerBookingView extends ConsumerWidget {
  const CustomerBookingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var bookingState = ref.watch(bookingViewModelProvider);
    var authState = ref.watch(authViewModelProvider);

    var bookingList = bookingState.allBookings
        .where((singleBooking) =>
            singleBooking.userName == authState.userEntity!.fullName)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookings'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, AppRoute.loginRoute);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: bookingList.length,
          itemBuilder: (context, index) {
            var booking = bookingList[index];
            var seats = booking.seatNumber;

            return Card(
              child: ListTile(
                title: Text('Movie Name : ${booking.movieName}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Seats : ${seats.toString()}'),
                    Text('Time : ${booking.time}'),
                    Text('Total Amount : ${booking.charge}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
