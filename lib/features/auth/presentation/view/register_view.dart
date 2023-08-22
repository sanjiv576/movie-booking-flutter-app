import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_ticket_booking/features/auth/domain/entity/user_entity.dart';
import 'package:movie_ticket_booking/features/auth/presentation/viewmodel/auth_viewmodel.dart';

import '../../../../config/router/app_route.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  final usernameController = TextEditingController();
  final contactController = TextEditingController();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confrimPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final List<String> _userRole = ['admin', 'customer'];
  String? _selectedRole;

  var gap = const SizedBox(height: 10);

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confrimPasswordController.dispose();
    fullNameController.dispose();
    contactController.dispose();
    super.dispose();
  }

  void submit() {
    if (formKey.currentState!.validate()) {

      if (passwordController.text.trim() !=
          confrimPasswordController.text.trim()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password and Confirm Password does not match'),
          ),
        );
        return;
      }

      UserEntity newUser = UserEntity(
        fullName: fullNameController.text.trim(),
        email: emailController.text.trim(),
        contact: contactController.text.trim(),
        role: _selectedRole.toString(),
        username: usernameController.text.trim(),
        password: passwordController.text.trim(),
      );


      ref.watch(authViewModelProvider.notifier).register(context, newUser);
    }
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
                    'Sign Up',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 3,
                  ),
                  gap,
                  const Text(
                    'Full Name',
                  ),
                  gap,
                  TextFormField(
                    controller: fullNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter full name';
                      }
                      return null;
                    },
                  ),
                  gap,
                  const Text(
                    'Role',
                  ),
                  gap,
                  DropdownButtonFormField(
                    items: _userRole
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) {
                      _selectedRole = value;
                    },
                    value: _selectedRole,
                    decoration: const InputDecoration(
                      labelText: 'Select Role',
                    ),
                    validator: ((value) {
                      if (value == null) {
                        return 'Please select batch';
                      }
                      return null;
                    }),
                  ),
                  gap,
                  const Text(
                    'Email',
                  ),
                  gap,
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                  ),
                  const Text(
                    'Contact',
                  ),
                  gap,
                  TextFormField(
                    controller: contactController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter contact';
                      }
                      return null;
                    },
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
                        return 'Please enter username';
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
                  const Text(
                    'Confirm Password',
                  ),
                  gap,
                  TextFormField(
                    controller: confrimPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter confirm password';
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
                        child: const Text('Sign up')),
                  ),
                  gap,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account ? '),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoute.loginRoute);
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
