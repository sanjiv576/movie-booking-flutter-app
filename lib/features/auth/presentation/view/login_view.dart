import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/router/app_route.dart';
import '../viewmodel/auth_viewmodel.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var gap = const SizedBox(height: 10);

  void submit() {
    if (formKey.currentState!.validate()) {
    

      ref.watch(authViewModelProvider.notifier).login(
            context,
            usernameController.text.trim(),
            passwordController.text.trim(),
          );
    }
  }

  // void _fromServer() async {
  //   Dio dio = Dio();
  //   final message = await dio.get(ApiEndpoints.baseUrl);
  //   print(message);
  // }

  @override
  void initState() {
    // _fromServer();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Movie Booking Ticket',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 3,
                  ),
                  gap,
                  const Text(
                    'Username',
                  ),
                  gap,
                  TextFormField(
                    controller: usernameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter account';
                      }
                      return null;
                    },
                  ),
                  gap,
                  const Text(
                    'Password',
                  ),
                  gap,
                  TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                  gap,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          submit();
                        },
                        child: const Text('Login')),
                  ),
                  gap,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account ? '),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRoute.registerRoute);
                          },
                          child: const Text(
                            'Signup',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  gap,
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //       onPressed: () {
                  //         Navigator.pushNamed(context, AppRoute.homeRoute);
                  //       },
                  //       child: const Text('HOme')),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
