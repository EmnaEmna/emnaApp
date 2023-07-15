import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:emnapp/data/repositories/signin_repository_impl.dart';
import 'package:emnapp/presentation/auth/form_submission_status.dart';
import 'package:emnapp/presentation/auth/signin/bloc/signin_event.dart';
import 'package:emnapp/presentation/auth/signin/bloc/signin_state.dart';
import 'package:equatable/equatable.dart';

// part 'signin_event.dart';
// part 'signin_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';





class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final AuthRepository? authRepo;

  SigninBloc({this.authRepo}) : super(SigninState());

  @override
  Stream<SigninState> mapEventToState(SigninEvent event) async* {
    // Username updated
    if (event is SigninEmailChanged) {
      yield state.copyWith(email: event.email);

      // Password updated
    } else if (event is SigninPasswordChanged) {
      yield state.copyWith(password: event.password);

      // Form submitted
    } else if (event is SigninSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepo?.signin();
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e as Exception));
      }
    }
  }
}


// // class SigninBloc extends Bloc<SigninEvent, SigninState> {
// //   SigninBloc() : super(SigninInitial());

// //   @override
// //   Stream<SigninState> mapEventToState(
// //     SigninEvent event,
// //   ) async* {
//     // if (event is SigninButtonPressed) {
//     //   yield SigninLoading();

//     //   try {
//     //     // Simulating an asynchronous sign-in process
//     //     await Future.delayed(Duration(seconds: 2));

//     //     // Check if the credentials are valid
//     //     if (event.username == 'example' && event.password == 'password') {
//     //       yield SigninSuccess();
//     //     } else {
//     //       yield SigninFailure(error: 'Invalid credentials');
//     //     }
//     //   } catch (error) {
//     //     yield SigninFailure(error: 'Sign-in failed');
//     //   }
// //     // }
// //   }
// // }
