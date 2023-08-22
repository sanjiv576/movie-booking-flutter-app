import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_ticket_booking/features/home/presentation/view/customer/bottom_view/customer_dashboard.dart';

import 'bottom_view/all_movies_view.dart';
import 'bottom_view/customer_booking_view.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  int selectedIndex = 0;
  List<Widget> lstScreen = [
    const CustomerDashboard(),

    const AllMoviesView(),
    // const PaymentView(),
    // const TicketView(),
    // const MovieView(),
    const CustomerBookingView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: lstScreen[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
            backgroundColor: Colors.black,
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.payment),
          //   label: 'Payment',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.airplane_ticket),
          //   label: 'Ticket',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.movie),
          //   label: 'Movie',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: 'View All Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: 'My Bookings',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
