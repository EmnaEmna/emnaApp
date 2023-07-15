// part of 'signin_bloc.dart';

abstract class SigninEvent  {
  // const SigninEvent();

  // @override
  // List<Object> get props => [];
}

class SigninEmailChanged extends SigninEvent {
  final String email;
  SigninEmailChanged({ required this.email});
}


class SigninPasswordChanged extends SigninEvent {
  final String? password;
  SigninPasswordChanged({ this.password});
}

///event for change checkbox
class ChangeCheckBoxEvent extends SigninEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class SigninSubmitted extends SigninEvent {
  
}


// class SigninButtonPressed extends SigninEvent {
//   final String username;
//   final String password;

//   SigninButtonPressed({required this.username, required this.password});

//   @override
//   List<Object> get props => [username, password];
// }

///event for change checkbox
// class ChangeCheckBoxEvent extends SigninEvent {
//   ChangeCheckBoxEvent({required this.value});

//   bool value;

//   @override
//   List<Object> get props => [
//         value,
//       ];
// }
