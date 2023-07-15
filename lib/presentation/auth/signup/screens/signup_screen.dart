import 'package:emnapp/core/app_export.dart';
import 'package:emnapp/presentation/auth/signin/screens/signin_screen.dart';
import 'package:emnapp/presentation/auth/signup/bloc/signup_bloc.dart';
import 'package:emnapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
   SignupScreen({super.key});
 final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController idEspritController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
 @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Signup'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: BlocConsumer<SignupBloc, SignupState>(
              listener: (context, state) {
                if (state is SignupSuccess) {
                  // Handle successful signup
                  // Example: Navigate to a success screen
                } else if (state is SignupFailure) {
                  // Handle signup failure
                  // Example: Show an error message
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Signup Error'),
                      content: Text(state.error),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: fullNameController,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: idEspritController,
                      decoration: InputDecoration(
                        labelText: 'ID Esprit',
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: mobileNumberController,
                      decoration: InputDecoration(
                        labelText: 'Mobile Number',
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 16.0),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     // Dispatch the SignupButtonPressed event
                    //     String fullName = fullNameController.text;
                    //     String email = emailController.text;
                    //     String idEsprit = idEspritController.text;
                    //     String mobileNumber = mobileNumberController.text;
                    //     String password = passwordController.text;
        
                    //     context.read<SignupBloc>().add(
                    //           SignupButtonPressed(
                    //             fullName: fullName,
                    //             email: email,
                    //             idEsprit: idEsprit,
                    //             mobileNumber: mobileNumber,
                    //             password: password,
                    //           ),
                    //         );
                    //   },
                    //   child: Text('Sign up'),
                    // ),
                      CustomButton(
                        onTap: (){},
                              height: getVerticalSize(50),
                              text: "Create Account",
                              margin: getMargin(top: 24, bottom: 5)),
                      SizedBox(height: 50.0),
              Text(
                'Already have an account? Awesome!',
                style: TextStyle(fontSize: 16.0),
              ),
                     SizedBox(height: 2.0),
              TextButton(
                onPressed: () {
                  // Perform navigation to the sign-in screen
                  // Add your navigation logic here
                   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SigninScreen()),
                    );
                },
                child: Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}