import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../config/router/app_route.dart';

class PaymentView extends ConsumerStatefulWidget {
  const PaymentView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PaymentViewState();
}

class _PaymentViewState extends ConsumerState<PaymentView> {
  bool _isMenuOpen = false;
  bool _isUserOpen = false;

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  void _toggleUser() {
    setState(() {
      _isUserOpen = !_isUserOpen;
    });
  }

  // Define a list to represent the seat layout (can be fetched from backend later)
  List<List<bool>> seatLayout = [
    [false, false, true, true, true, false, false],
    [false, true, true, true, true, true, false],
    [true, true, true, true, true, true, true],
    [true, true, true, true, true, true, true],
    [true, true, true, true, true, true, true],
    [false, true, true, true, true, true, false],
    [false, false, true, true, true, false, false],
  ];

  List<String> seatLabels = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];

  // Define a function to toggle the seat selection
  void _toggleSeatSelection(int row, int column) {
    setState(() {
      seatLayout[row][column] = !seatLayout[row][column];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
            255, 225, 225, 41), // Yellow background for the app bar
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: _toggleMenu,
        ),
        title: const Text(
          'Ticket',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: _toggleUser,
          ),
        ],
      ),
      // bottomNavigationBar: Container(
      //   color: Colors.white,
      //   padding: const EdgeInsets.symmetric(vertical: 8.0),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       IconButton(
      //         onPressed: () {
      //           // Navigate to DashboardView
      //           Navigator.pushNamed(context, AppRoute.userDashboardRoute);
      //         },
      //         icon: const Icon(Icons.home),
      //       ),
      //       IconButton(
      //         onPressed: () {
      //           // Handle 'Theater' icon press
      //         },
      //         icon: const Icon(Icons.theater_comedy),
      //       ),
      //       IconButton(
      //         onPressed: () {
      //           // Handle 'Movie' icon press
      //           Navigator.pushNamed(context, AppRoute.movieListRoute);
      //         },
      //         icon: const Icon(Icons.movie),
      //       ),
      //       IconButton(
      //         onPressed: () {
      //           // Handle 'Ticket' icon press
      //           Navigator.pushNamed(context, AppRoute.ticketRoute);
      //         },
      //         icon: const Icon(Icons.event),
      //       ),
      //     ],
      //   ),
      // ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('FAQ'),
              onTap: () {
                // Handle FAQ tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.description),
              title: const Text('Terms & Conditions'),
              onTap: () {
                // Handle Terms & Conditions tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Privacy Policy'),
              onTap: () {
                // Handle Privacy Policy tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Cinema'),
              onTap: () {
                // Handle About Cinema tap
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      endDrawer: const Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              // Add user avatar image here
            ),
            SizedBox(height: 10),
            Text(
              'Username',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            // Add user information and options here, like 'About user' and 'Settings'
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(
                255, 245, 197, 40), // Yellow background for the body content
          ),
          if (_isMenuOpen)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: _toggleMenu, // Close the menu when tapped outside
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          if (_isMenuOpen)
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              width: MediaQuery.of(context).size.width * 0.35,
              child: Container(
                color: Colors.brown,
                child: ListView(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.help),
                      title: const Text('FAQ'),
                      onTap: () {
                        // Handle FAQ tap
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.description),
                      title: const Text('Terms & Conditions'),
                      onTap: () {
                        // Handle Terms & Conditions tap
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.privacy_tip),
                      title: const Text('Privacy Policy'),
                      onTap: () {
                        // Handle Privacy Policy tap
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.info),
                      title: const Text('About Cinema'),
                      onTap: () {
                        // Handle About Cinema tap
                      },
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
