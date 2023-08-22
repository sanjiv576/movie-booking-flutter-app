import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_ticket_booking/features/movies/domain/entity/movie_entity.dart';

import '../../../../../../config/router/app_route.dart';

class TicketView extends ConsumerStatefulWidget {
  const TicketView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TicketViewState();
}

class _TicketViewState extends ConsumerState<TicketView> {
  bool _isMenuOpen = false;
  bool _isUserOpen = false;

  late MovieEntity movie;

  @override
  void didChangeDependencies() {
    movie = ModalRoute.of(context)!.settings.arguments as MovieEntity;

    super.didChangeDependencies();
  }

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

  List<String> selectedSeats = [];

  // Define a function to toggle the seat selection
  void _toggleSeatSelection(int row, int column) {
    setState(() {
      bool isSelected = seatLayout[row][column];
      if (isSelected) {
        selectedSeats.remove('${seatLabels[row]}${column + 1}');
      } else {
        selectedSeats.add('${seatLabels[row]}${column + 1}');
      }
      seatLayout[row][column] = !isSelected;
    });
  }

  // Function to handle the 'Confirm' button press
  // void _onConfirmButtonPressed() {
  //   if (selectedSeats.isNotEmpty) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const payment(),
  //       ),
  //     );
  //   } else {
  //     // Show a snackbar indicating no seats were selected
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Please select at least one seat.')),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color.fromARGB(
        //     255, 225, 225, 41), // Yellow background for the app bar
        // leading: IconButton(
        //   icon: const Icon(Icons.menu, color: Colors.black),
        //   onPressed: _toggleMenu,
        // ),
        title: Text(
          movie.title,
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, AppRoute.loginRoute);
              },
              icon: const Icon(Icons.logout))
        ],
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.person, color: Colors.black),
        //     onPressed: _toggleUser,
        //   ),
        // ],
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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select Seats',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16.0),
                  _buildSeatLayout(),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    // onPressed: _onConfirmButtonPressed,
                    onPressed: () {},
                    child: Text('Confirm (${selectedSeats.length} seats)'),
                  ),
                  // ... Other UI elements for ticket booking ...
                ],
              ),
            ),
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

  Widget _buildSeatLayout() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (int row = 0; row < seatLayout.length; row++)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int column = 0; column < seatLayout[row].length; column++)
                  _buildSeat(row, column),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildSeat(int row, int column) {
    bool isAvailable = seatLayout[row][column];
    Color seatColor = isAvailable ? Colors.green : Colors.grey;
    return GestureDetector(
      onTap: isAvailable
          ? () {
              _toggleSeatSelection(row, column);
            }
          : null,
      child: Container(
        margin: const EdgeInsets.all(4.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: seatColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          '${seatLabels[row]}${column + 1}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
