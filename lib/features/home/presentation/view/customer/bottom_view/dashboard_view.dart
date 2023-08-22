import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  bool _isMenuOpen = false;
  bool _isUserOpen = false;
  int _currentCarouselIndex = 0;

  // List<String> nowShowingMovies = [
  //   'assets/images/w.jpg',
  //   'assets/images/w.jpg',
  //   'assets/images/w.jpg',
  // ];

  // List<String> trendingMovies = [
  //   'assets/images/w.jpg',
  //   'assets/images/w.jpg',
  //   'assets/images/w.jpg',
  // ];

  // List<String> comingSoonMovies = [
  //   'assets/images/t.jpg',
  //   'assets/images/t.jpg',
  //   'assets/images/t.jpg',
  // ];
  List<String> promotionImages = [
    'https://imgs.search.brave.com/Y0NQ2Xfzw9UFBdPiGC748mlWUGSu4WLoXeO7XnwQl3M/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93YWxs/cGFwZXJjYXZlLmNv/bS93cC9TcHZYdlZW/LmpwZw',
    'https://imgs.search.brave.com/Z6wk3VhvxnJbFQKD09pxPWxsly9cTP_9val2KZyYnPk/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMuYWxwaGFjb2Rl/cnMuY29tLzI3MC8y/NzA5NjMuanBn'
  ];

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

  void _onCarouselPageChanged(int index, CarouselPageChangedReason reason) {
    setState(() {
      _currentCarouselIndex = index;
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
          'Dash',
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
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) => const DashboardView()),
      //           );
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
      //           // Navigator.push(
      //           //   context,
      //           //   MaterialPageRoute(builder: (context) => const Movie()),
      //           // );
      //         },
      //         icon: const Icon(Icons.movie),
      //       ),
      //       IconButton(
      //         onPressed: () {
      //           // Handle 'Ticket' icon press
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
          Positioned(
            top: 10.0, // Adjust the top position as needed
            left: 20.0,
            right: 20.0,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 248, 228, 228),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2.0,
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search Movie',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                ),
              ),
            ),
          ),
          Positioned(
            top: 70.0, // Adjust the top position as needed
            left: 2.0,
            right: 2.0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 125, // Specify the desired width
                      child: Container(
                        color: Colors.yellow.withOpacity(0.9),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('Now Showing',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 125, // Specify the desired width
                      child: Container(
                        color: Colors.yellow.withOpacity(0.9),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('Trending',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 125, // Specify the desired width
                      child: Container(
                        color: Colors.yellow.withOpacity(0.9),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('Coming Soon',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10.0),
                CarouselSlider(
                  items: promotionImages.map((movie) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Image.asset(
                            movie,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 150.0,
                    initialPage: _currentCarouselIndex,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    onPageChanged: _onCarouselPageChanged,
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle 'Details' button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Details',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                        width: 50.0), // Add some spacing between the buttons
                    ElevatedButton(
                      onPressed: () {
                        // Handle 'Booking' button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Booking',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                    height:
                        20.0), // Add some vertical spacing between the buttons and the carousel
                CarouselSlider(
                  items: promotionImages.map((imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            color: Colors
                                .blueAccent, // Change the background color or decoration as needed
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 200.0, // Adjust the height as needed
                    autoPlay: true,
                    autoPlayInterval: const Duration(
                        seconds: 5), // Set the interval for auto-sliding
                    enableInfiniteScroll: true,
                    onPageChanged: _onCarouselPageChanged,
                  ),
                ),
              ],
            ),
          ),
          if (_isMenuOpen)
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              width: MediaQuery.of(context).size.width * 0.65,
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
