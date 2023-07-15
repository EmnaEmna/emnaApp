import 'package:emnapp/presentation/auth/signin/bloc/signin_bloc.dart';
import 'package:emnapp/presentation/auth/signin/screens/signin_screen.dart';
import 'package:emnapp/presentation/auth/signup/screens/signup_screen.dart';
import 'package:emnapp/presentation/list_view.dart';
import 'package:emnapp/presentation/offeringsHome/bloc/offerings_home_bloc.dart';
import 'package:emnapp/presentation/offeringsHome/screens/offerings_home.dart';
import 'package:emnapp/presentation/offeringsHome/widgets/listfavorite_item_widget.dart';
import 'package:emnapp/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign In Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<OfferingsHomeBloc>(
        create: (context) => OfferingsHomeBloc(OfferingsHomeState()),
        child: OfferingsHomeScreen(),
      ),
      onGenerateRoute: AppRouter.generateRoute,

      // home: Scaffold(
      //   body: Center(
      //     child: ListViewScreen(),
      //   ),
      // ),
   );
  }
}

class MyAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListViewScreen();
  }
}
