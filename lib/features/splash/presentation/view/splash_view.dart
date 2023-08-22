import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/router/app_route.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      // Navigator.popAndPushNamed(context, AppRoute.loginRoute);

      // this decides whether user is already logged in or not

      // ref.read(splashViewModelProvider.notifier).init(context);

      Navigator.pushNamed(context, AppRoute.welcomeRoute);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/images/logo.png'),
                  // child: Image.network(
                  //     'https://imgs.search.brave.com/RafUokX4av4g_4o3rAyr3mLftvT5kciOOM4fc6gywII/rs:fit:860:0:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzAxLzgwLzQ4Lzk4/LzM2MF9GXzE4MDQ4/OTg0NF9mc0swUDdR/Q2Zlem5Ub1lSdnNM/bTNmTjVvTUdTUUNC/dy5qcGc'),
                ),
                const Text(
                  'Movie Booking Ticket',
                  style: TextStyle(
                    fontSize: 25,
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
