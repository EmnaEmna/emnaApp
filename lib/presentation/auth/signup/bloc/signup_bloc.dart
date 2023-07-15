import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) {
      // TODO: implement event handler
if (event is SignupButtonPressed) {
        _mapSignupButtonPressedToState(event, emit);
      }    });
  }

  Future<void> _mapSignupButtonPressedToState(
    SignupButtonPressed event,
    Emitter<SignupState> emit,
  ) async {
    emit(SignupLoading());

    try {
      // Add your signup logic here
      // Example: Call an API to register the user
      await Future.delayed(Duration(seconds: 2));

      emit(SignupSuccess());
    } catch (error) {
      emit(SignupFailure(error: 'Failed to sign up'));
    }
  }
}
