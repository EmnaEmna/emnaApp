import 'package:emnapp/presentation/auth/form_submission_status.dart';

class SigninState {
  final String email;
  bool get isValidEmail => email.length > 3;
  //   bool get isValidEmail {
  // // Regular expression pattern for validating email format
  // final RegExp emailRegex =
  //     RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$');

//   return emailRegex.hasMatch(email);
// }

  final String password;
  bool get isValidPassword => password.length > 6;

  bool isCheckbox ; 

  final FormSubmissionStatus formStatus;

  SigninState({
    this.email = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
    this.isCheckbox = false,
  });

  SigninState copyWith({
    String email = "",
    String? password,
    FormSubmissionStatus,
    formStatus,
     bool? isCheckbox,
  }) {
    return SigninState(
      email: email ?? this.email,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
            isCheckbox: isCheckbox ?? this.isCheckbox,

    );
  }
}

//   const SigninState();

//   @override
//   List<Object> get props => [];
// }

// class SigninInitial extends SigninState {}

// class SigninLoading extends SigninState {}

// class SigninSuccess extends SigninState {}

// class SigninFailure extends SigninState {
//   final String error;

//   SigninFailure({required this.error});

//   @override
//   List<Object> get props => [error];
//}
