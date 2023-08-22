import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_ticket_booking/core/common/widget/toast_message.dart';
import 'package:movie_ticket_booking/features/booking/domain/entity/booking_entity.dart';
import 'package:movie_ticket_booking/features/booking/domain/entity/seat.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../../../../config/router/app_route.dart';
import '../../../../../booking/presentation/viewmodel/booking_viewmodel.dart';
import '../../../../../movies/domain/entity/movie_entity.dart';

class TicketViewSelection extends ConsumerStatefulWidget {
  const TicketViewSelection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TicketViewSelectionState();
}

class _TicketViewSelectionState extends ConsumerState<TicketViewSelection> {
  late MovieEntity movie;

  late String movieId;
  @override
  void didChangeDependencies() {
    movie = ModalRoute.of(context)!.settings.arguments as MovieEntity;

    super.didChangeDependencies();
  }

  final List<bool> _isSelected = List.generate(100, (index) => false);
  var defaultColor = Colors.green;

  // final List<SeatEntity> _selectedSeats = [];
  final List<dynamic> _selectedSeats = [];

  void _handleBooking(BuildContext context) {
    if (_selectedSeats.isEmpty) {
      showToastMessage(message: 'Please select at least one seat');
      return;
    }

    BookingEntity bookingEntity = BookingEntity(
      movieId: movie.id,
      userName: 'user',
      movieName: movie.title,
      time: '10:00 AM',
      date: '2021-09-09',
      seatNumber: _selectedSeats,
      charge: '${_selectedSeats.length * 100}',
    );

    Alert(
      context: context,
      type: AlertType.warning,
      title: 'Confirmation',
      desc: 'Do you want to book the seat ?',
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          color: const Color.fromRGBO(0, 179, 134, 1.0),
          child: const Text(
            "No",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        DialogButton(
          onPressed: () {
            ref
                .watch(bookingViewModelProvider.notifier)
                .createReservation(context, movie.id.toString(), bookingEntity);
          },
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
          child: const Text(
            "Yes",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          movie.title,
          style: const TextStyle(fontSize: 20),
        ),
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
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 8,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  for (int i = 0; i < 100; i++) ...{
                    GestureDetector(
                      child: Container(
                        height: 30,
                        color: _isSelected[i] ? Colors.red : Colors.green,
                        child: Center(
                          child: Text(
                            '${i + 1}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _isSelected[i] = true;
                        });

                        SeatEntity seatEntity = SeatEntity('${i + 1}');

                        _selectedSeats.add('${i + 1}');
                        // _selectedSeats.add(seatEntity);
                      },
                    ),
                  }
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text('Selected Seats: ${_selectedSeats.join(', ')}'),
            Text(
                'Total selected seats: ${_isSelected.where((element) => element).length}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _handleBooking(context);
                // Navigator.of(context).pushNamed('/booking', arguments: {
                //   'movie': movie,
                //   'seats': _selectedSeats,
                // });
              },
              child: const Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}
