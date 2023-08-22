import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../movies/presentation/viewmodel/movie_viewmodel.dart';

class MovieView extends ConsumerStatefulWidget {
  const MovieView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MovieViewState();
}

class _MovieViewState extends ConsumerState<MovieView> {
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

  List<String> romance = [
    'assets/images/w.jpg',
    'assets/images/w.jpg',
    'assets/images/w.jpg',
    'assets/images/w.jpg',
    'assets/images/w.jpg',
    'assets/images/w.jpg',
  ];

  List<String> action = [
    'assets/images/w.jpg',
    'assets/images/t.jpg',
    'assets/images/w.jpg',
    'assets/images/w.jpg',
    'assets/images/t.jpg',
    'assets/images/w.jpg',
  ];

  List<String> sad = [
    'assets/images/t.jpg',
    'assets/images/t.jpg',
    'assets/images/t.jpg',
    'assets/images/t.jpg',
    'assets/images/t.jpg',
    'assets/images/t.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    var movieState = ref.watch(movieViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 225, 225, 41),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: _toggleMenu,
        ),
        title: const Text(
          'Movies List',
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
      //           // Navigator.push(
      //           //   context,
      //           //   MaterialPageRoute(builder: (context) => const DashboardView()),
      //           // );
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
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => const MovieView()),
      //           );
      //         },
      //         icon: const Icon(Icons.movie),
      //       ),
      //       IconButton(
      //         onPressed: () {
      //           // Navigator.push(
      //           //   context,
      //           //   MaterialPageRoute(builder: (context) => const ticket()),
      //           // );
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
      body: Container(
        color: const Color.fromARGB(
            255, 245, 197, 40), // Yellow background for the body content
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Romance',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 200.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return _buildMovieCard(
                        'Coming Soon $index', romance[index], '4.5');
                  },
                ),
              ),
              const SizedBox(height: 24.0),
              const Text(
                'Action',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 200.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return _buildMovieCard(
                        'Coming Soon $index', action[index], '4.5');
                  },
                ),
              ),
              const SizedBox(height: 24.0),
              const Text(
                'Sad',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 200.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return _buildMovieCard(
                        'Coming Soon $index', sad[index], '4.5');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMovieCard(String title, String imagePath, String rating) {
    return Container(
      width: 120.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(10.0)),
            child: Image.asset(
              imagePath,
              height: 120.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                const Icon(Icons.star, size: 16, color: Colors.orange),
                const SizedBox(width: 4.0),
                Text(
                  rating,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
