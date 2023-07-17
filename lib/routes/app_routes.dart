import 'package:emnapp/data/repositories/signin_repository_impl.dart';
import 'package:emnapp/presentation/auth/signup/screens/signup_screen.dart';
import 'package:emnapp/presentation/profile/profile_edit/screens/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:emnapp/presentation/auth/signin/screens/signin_screen.dart';
import 'package:emnapp/presentation/auth/signin/bloc/signin_bloc.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case '/':
            case '/a':

        return MaterialPageRoute(
          builder: (_) => RepositoryProvider(
            create: (context) => AuthRepository(),
            child: SigninScreen(),
          ),
        );
      case '/signupScreen':
        return MaterialPageRoute(
          builder: (_) => RepositoryProvider(
            create: (context) => AuthRepository(),
            child: SignupScreen(),
          ),
        );
             case '/':

      // case '/profileEdit':
        return MaterialPageRoute(
          builder: (_) => RepositoryProvider(
            create: (context) => AuthRepository(),
            child: EditProfileScreen(),
          ),
        );
      // Add other routes here
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('Route not found: ${settings.name}'),
            ),
          );
        });
    }
  }
}
