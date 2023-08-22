import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_ticket_booking/core/common/widget/toast_message.dart';

import '../../../../config/router/app_route.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/use_case/auth_use_case.dart';
import '../state/auth_state.dart';

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel(
    // NOte: should mock here by Mockito in order to avoid real network call
    ref.read(authUseCaseProvider),
  );
});

// NOte: Ui calls the functions of this class
class AuthViewModel extends StateNotifier<AuthState> {
  final AuthUseCase _authUseCase;

  AuthViewModel(this._authUseCase) : super(AuthState(isLoading: false));

  Future<void> register(BuildContext context, UserEntity user) async {
    state = state.copyWith(isLoading: true);
    var data = await _authUseCase.register(user);
    data.fold((failure) {
      state = state.copyWith(isLoading: false, error: failure.error);

      showAlertMessage(
          context: context, description: failure.error, title: 'Error');
    }, (success) {
      state = state.copyWith(isLoading: false, error: null);
      Navigator.pushNamed(context, AppRoute.loginRoute);
    });
  }

  Future<void> login(
      BuildContext context, String username, String password) async {
    state = state.copyWith(isLoading: true);
    var data = await _authUseCase.login(username, password);
    data.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.error);

        // showToastMessage(message: failure.error);
        showAlertMessage(
            context: context, description: failure.error, title: 'Not Found');
      },
      (userData) {
        state =
            state.copyWith(isLoading: false, error: null, userEntity: userData);

        if (username == 'admin' && password == 'admin') {
          Navigator.popAndPushNamed(context, AppRoute.adminHomeRoute);
        } else {
          Navigator.popAndPushNamed(context, AppRoute.homeRoute);
        }
      },
    );
  }

// call this function when the images upload
//   Future<void> uploadImage(File? file) async {
//     state = state.copyWith(isLoading: true);
//     var data = await _authUseCase.uploadProfilePictre(file!);

// // left
//     data.fold((l) {
//       state = state.copyWith(isLoading: false, error: l.error);
//     },
//         // right folod
//         (imageName) {
//       state =
//           state.copyWith(isLoading: false, error: null, imageName: imageName);
//     });
//   }
}
