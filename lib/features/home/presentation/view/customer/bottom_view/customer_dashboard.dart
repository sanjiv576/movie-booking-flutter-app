import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../config/router/app_route.dart';
import '../../../../../movies/presentation/viewmodel/movie_viewmodel.dart';

class CustomerDashboard extends ConsumerStatefulWidget {
  const CustomerDashboard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomerDashboardState();
}

class _CustomerDashboardState extends ConsumerState<CustomerDashboard> {
  int _currentCarouselIndex = 0;
  void _onCarouselPageChanged(int index, CarouselPageChangedReason reason) {
    setState(() {
      _currentCarouselIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var movieState = ref.watch(movieViewModelProvider);
    var moviesList = movieState.allMovies;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, AppRoute.loginRoute);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(
                255, 245, 197, 40), // Yellow background for the body content
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
                  items: moviesList.map((movie) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Image.network(
                            'https://imgs.search.brave.com/UJJ8hWvCHWXoY22glnKQ-zAo2BpaqI4usicaOvWCr18/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/NzFNWDI3N0RhbUwu/anBn',
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
                  items: moviesList.map((imagePath) {
                    return Builder(
                      builder: (
                        BuildContext context,
                      ) {
                        return Column(
                          children: [
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                decoration: BoxDecoration(
                                  color: Colors
                                      .blueAccent, // Change the background color or decoration as needed
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Image.network(
                                  'https://imgs.search.brave.com/UJJ8hWvCHWXoY22glnKQ-zAo2BpaqI4usicaOvWCr18/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/NzFNWDI3N0RhbUwu/anBn',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              imagePath.title,
                              style: const TextStyle(fontSize: 30),
                            ),
                          ],
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    scrollDirection: Axis.vertical,
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
        ],
      ),
    );
  }
}
