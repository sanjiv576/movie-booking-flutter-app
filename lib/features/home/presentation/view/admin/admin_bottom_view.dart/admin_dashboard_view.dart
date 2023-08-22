import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_ticket_booking/core/common/widget/toast_message.dart';
import 'package:movie_ticket_booking/features/movies/domain/entity/movie_entity.dart';
import 'package:movie_ticket_booking/features/movies/presentation/viewmodel/movie_viewmodel.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../../config/router/app_route.dart';
import '../../../../../auth/presentation/viewmodel/auth_viewmodel.dart';

class AdminDashboardView extends ConsumerStatefulWidget {
  const AdminDashboardView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdminDashboardViewState();
}

class _AdminDashboardViewState extends ConsumerState<AdminDashboardView> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _clearControllers() {
    titleController.clear();
    descriptionController.clear();
  }

  checkCameraPermission() async {
    if (await Permission.camera.request().isRestricted ||
        await Permission.camera.request().isDenied) {
      await Permission.camera.request();
    }
  }

  File? _img; // take any files like images, pdf, txt
  Future _browseImage(WidgetRef ref, ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          _img = File(image.path);
          // print('Image data here $_img');
          // upload image on the server
          // ref.read(authViewModelProvider.notifier).uploadImage(_img);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  final _gap = const SizedBox(height: 20);

  void _showBottomCameraSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.grey[300],
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                checkCameraPermission();
                _browseImage(ref, ImageSource.camera);
                Navigator.pop(context);
                // Upload image it is not null
              },
              icon: const Icon(Icons.camera),
              label: const Text('Camera'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                _browseImage(ref, ImageSource.gallery);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.image),
              label: const Text('Gallery'),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    confirmationAlert(context, 'Add Movie',
        'Are you sure want to add ${titleController.text.trim()} movie ?', () {
      MovieEntity newMovie = MovieEntity(
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
      );


      ref.watch(movieViewModelProvider.notifier).addMovie(newMovie);
      Navigator.pop(context);
      _clearControllers();
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var authState = ref.watch(authViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin dashboard'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, AppRoute.loginRoute);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    InkWell(
                      onTap: _showBottomCameraSheet,
                      child: SizedBox(
                        height: 200,
                        width: 200,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: _img != null
                              ? FileImage(_img!)
                              : const AssetImage('assets/images/logo.png')
                                  as ImageProvider,
                        ),
                      ),
                    ),
                    _gap,
                    Text(
                      authState.userEntity!.fullName,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              _gap,
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Add Movie',
                      style: TextStyle(fontSize: 30),
                    ),
                    _gap,
                    TextFormField(
                      controller: titleController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter title';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        labelText: 'Movie title',
                      ),
                    ),
                    _gap,
                    TextFormField(
                      controller: descriptionController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        labelText: 'Movie description',
                      ),
                    ),
                    _gap,
                    const Text(
                      'Movie Picture',
                      style: TextStyle(fontSize: 18),
                    ),
                    InkWell(
                      onTap: _showBottomCameraSheet,
                      child: SizedBox(
                        height: 200,
                        width: 200,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: _img != null
                              ? FileImage(_img!)
                              : const AssetImage('assets/images/logo.png')
                                  as ImageProvider,
                        ),
                      ),
                    ),
                    _gap,
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _submit();
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
