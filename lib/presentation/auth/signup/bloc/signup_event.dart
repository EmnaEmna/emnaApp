part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}
class SignupButtonPressed extends SignupEvent {
  final String fullName;
  final String email;
  final String idEsprit;
  final String mobileNumber;
  final String password;

  const SignupButtonPressed({
    required this.fullName,
    required this.email,
    required this.idEsprit,
    required this.mobileNumber,
    required this.password,
  });

  @override
  List<Object> get props => [fullName, email, idEsprit, mobileNumber, password];
}