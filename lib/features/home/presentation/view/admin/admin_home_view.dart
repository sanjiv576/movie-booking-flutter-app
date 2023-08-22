import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_ticket_booking/features/home/presentation/view/admin/admin_bottom_view.dart/admin_booking_view.dart';
import 'package:movie_ticket_booking/features/home/presentation/view/customer/bottom_view/all_movies_view.dart';

import 'admin_bottom_view.dart/admin_dashboard_view.dart';

class AdminHomeView extends ConsumerStatefulWidget {
  const AdminHomeView({super.key});

  @override
  ConsumerState<AdminHomeView> createState() => _AdminHomeViewState();
}

class _AdminHomeViewState extends ConsumerState<AdminHomeView> {
  int selectedIndex = 0;
  List<Widget> lstScreen = [
    const AdminDashboardView(),
    const AdminBookingView(),
    const AllMoviesView()
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
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_roll),
            label: 'All Movies',
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
