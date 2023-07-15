import 'package:emnapp/core/utils/color_constant.dart';
import 'package:emnapp/core/utils/image_constant.dart';
import 'package:emnapp/core/utils/size_utils.dart';
import 'package:emnapp/data/repositories/signin_repository_impl.dart';
import 'package:emnapp/localization/app_localizations.dart';
import 'package:emnapp/presentation/auth/form_submission_status.dart';
import 'package:emnapp/presentation/auth/signin/bloc/signin_bloc.dart';
import 'package:emnapp/presentation/auth/signin/bloc/signin_event.dart';
import 'package:emnapp/presentation/auth/signin/bloc/signin_state.dart';
import 'package:emnapp/theme/app_style.dart';
import 'package:emnapp/widgets/app_bar/custom_app_bar.dart';
import 'package:emnapp/widgets/custom_button.dart';
import 'package:emnapp/widgets/custom_checkbox.dart';
import 'package:emnapp/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninScreen extends StatelessWidget {
  // final TextEditingController _usernameController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  // GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //     body: BlocProvider(
    //   create: (context) => SigninBloc(authRepo: context.read<AuthRepository>()),
    //   child: _signinForm(),
    // ),
    appBar: AppBar(
      title: Text('Signup'),
    ),
    body:_signinForm(),
    );
  }

  Widget _signinForm() {
    return BlocListener<SigninBloc, SigninState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is SubmissionFailed) {
          _showSnackBar(context, formStatus.exception.toString());
        }
      },
      child: Align(
              alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [_logoImage(), _emailField(), _passwordField(), _loginButton(),_rememberMe(), _forgotPassword(),_singinWith(),_signup()],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _logoImage() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 20.0),
    child: Image.asset(
      'assets/images/logo1.png',
      // Remplacez 'logo.png' par le chemin relatif de votre image à partir du dossier 'assets'
      width: 150.0,
      height: 150.0,
    ),
  );
}


Widget _rememberMe() {
  return Padding(
    padding: getPadding(left: 1, top: 9, right: 7),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocSelector<SigninBloc, SigninState, bool?>(
          selector: (state) => state.isCheckbox,
          builder: (context, isCheckbox) {
            return CustomCheckbox(
              text: "Remember me",
              value: isCheckbox,
              fontStyle: CheckboxFontStyle.GilroyMedium14,
              onChange: (value) {
                context.read<SigninBloc>().add(
                      ChangeCheckBoxEvent(value: value),
                    );
              },
            );
          },
        ),
        // Add more widgets to the Row if needed
      ],
    ),
  );
}

Widget _forgotPassword(){
  return  Align(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton(
        onPressed: () {
          // Ajoutez ici la logique pour la fonctionnalité "Mot de passe oublié"
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero, // Supprime l'espace autour du texte
          minimumSize: Size(0, 0), // Ajuste la taille minimale du bouton
        ),
        child: Text(
          'Forgot Password?',
          style: TextStyle(
            color: Colors.blue, // Couleur du texte
            decoration: TextDecoration.underline, // Soulignement du texte
          ),
        ),
      ),
    );
                             
}


Widget _singinWith(){
  return Column(children: [
    
     Padding(
                  padding: getPadding(left: 1, top: 26, right: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: getPadding(top: 10, bottom: 7),
                        child: SizedBox(
                          width: getHorizontalSize(130),
                          child: Divider(
                            height: getVerticalSize(1),
                            thickness: getVerticalSize(1),
                            color: ColorConstant.blueGray200,
                          ),
                        ),
                      ),
                      Text(
                        "Continue_with",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtGilroyRegular16,
                      ),
                      Padding(
                        padding: getPadding(top: 10, bottom: 7),
                        child: SizedBox(
                          width: getHorizontalSize(129),
                          child: Divider(
                            height: getVerticalSize(1),
                            thickness: getVerticalSize(1),
                            color: ColorConstant.blueGray200,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
       CustomButton(
                              height: getVerticalSize(50),
                              text: "Sign in with Google",
                              margin: getMargin(left: 2, top: 28),
                              prefixWidget: Container(
                                  margin: getMargin(right: 8),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgGoogle)),
                              onTap: () {
                               // onTapSigninwithgoogle(context);
                              }),
                          CustomButton(
                              height: getVerticalSize(50),
                              text: "Sign in with Facebook",
                              margin: getMargin(left: 2, top: 16),
                              prefixWidget: Container(
                                  padding:
                                      getPadding(left: 9, top: 4, right: 3),
                                  margin: getMargin(right: 8),
                                  decoration: BoxDecoration(
                                      color: ColorConstant.blue700,
                                      borderRadius: BorderRadius.circular(
                                          getHorizontalSize(3))),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgFacebook)),
                              onTap: () {
                                //onTapSigninwithfacebook(context);
                              }),
                          CustomButton(
                              height: getVerticalSize(50),
                              text: "Sign in with Linkedin",
                              margin: getMargin(left: 2, top: 16, bottom: 5),
                              prefixWidget: Container(
                                  margin: getMargin(right: 8),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgLinkedin11)))
                        ]);
  
}
 Widget _emailField() {
  return BlocBuilder<SigninBloc, SigninState>(builder: (context, state) {
    return TextFormField(
      decoration: InputDecoration(icon: Icon(Icons.email), hintText: 'Email'),
      validator: (value) => state.isValidEmail ? null : 'Invalid email',
      onChanged: (value) =>
          context.read<SigninBloc>().add(SigninEmailChanged(email: value)),
    );
  }, buildWhen: (previousState, currentState) {
    return previousState.email != currentState.email; // Optional condition to rebuild the widget only when email changes
  });
}

  Widget _passwordField() {
    return BlocBuilder<SigninBloc, SigninState>(builder: (context, state) {
      return TextFormField(
        obscureText: true,
        decoration:
            InputDecoration(icon: Icon(Icons.security), hintText: 'Password'),
        validator: (value) =>
            state.isValidPassword ? null : 'Password too short',
        onChanged: (value) => context
            .read<SigninBloc>()
            .add(SigninPasswordChanged(password: value)),
      );
    });
  }

  Widget _loginButton() {
    return BlocBuilder<SigninBloc, SigninState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? CircularProgressIndicator()
          // : ElevatedButton(
          //     onPressed: () {
          //       if (_formKey.currentState!.validate()) {
          //         context.read<SigninBloc>().add(SigninSubmitted());
          //       }
          //     },
          //     child: Text('Sign in'),
          //   );
          :Column(
              children: [
                CustomButton(
                  height: getVerticalSize(50),
                  text: "Sign in",
                  margin: getMargin(left: 1, top: 25),
                  variant: ButtonVariant.FillBlueA700,
                  padding: ButtonPadding.PaddingAll14,
                  fontStyle: ButtonFontStyle.GilroyMedium16,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<SigninBloc>().add(SigninSubmitted());
                    }
                  },
                ),
               
              ],
            );
    });
  }


Widget _signup() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "New?",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 8.0),
        TextButton(
          onPressed: () {
            // Action à effectuer lors du clic sur le bouton "Create an account"
          },
          child: Text(
            "Create an account",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    ),
  );
}

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}


onTapSigninwithgoogle(BuildContext context) async {
  // await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
  //   if (googleUser != null) {
  //     //TODO Actions to be performed after signin
  //   } else {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('user data is empty')));
  //   }
  // }).catchError((onError) {
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text(onError.toString())));
  // });
}

onTapSigninwithfacebook(BuildContext context) async {
  // await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
  //   //TODO Actions to be performed after signin
  // }).catchError((onError) {
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text(onError.toString())));
  // });
}

onTapImgArrowleft(BuildContext context) {
  // NavigatorService.goBack();
}
