import 'package:emnapp/core/app_export.dart';
import 'package:emnapp/core/utils/validation_functions.dart';
import 'package:emnapp/presentation/profile/profile_edit/bloc/profile_edit_bloc.dart';
import 'package:emnapp/presentation/profile/profile_edit/models/edit_profile_model.dart';
import 'package:emnapp/widgets/app_bar/custom_app_bar.dart';
import 'package:emnapp/widgets/app_bar/custom_icon_button.dart';
import 'package:emnapp/widgets/custom_button.dart';
import 'package:emnapp/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
//   const EditProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileEditBloc>(
        create: (context) => ProfileEditBloc(
            ProfileEditState(editProfileModelObj: EditProfileModel()))
          ..add(EditProfileInitialEvent()),
        child: EditProfileScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                height: getVerticalSize(48),
                leadingWidth: 40,
                leading: CustomImageView(
                    svgPath: ImageConstant.imgArrowleft,
                    height: getSize(24),
                    width: getSize(24),
                    margin: getMargin(left: 16, top: 12, bottom: 12),
                    onTap: () {
                      onTapImgArrowleft(context);
                    }),
                centerTitle: true,
                title: Text("Edit Profile",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtGilroySemiBold24)),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 15, top: 25, right: 15, bottom: 25),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                  height: getSize(150),
                                  width: getSize(150),
                                  child: Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        CustomImageView(
                                            imagePath: ImageConstant
                                                .imgEllipse5150x150,
                                            height: getSize(150),
                                            width: getSize(150),
                                            radius: BorderRadius.circular(
                                                getHorizontalSize(75)),
                                            alignment: Alignment.center),
                                        CustomIconButton(
                                            height: 30,
                                            width: 30,
                                            margin: getMargin(top: 5, right: 2),
                                            alignment: Alignment.topRight,
                                            child: CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgForward))
                                      ]))),
                          Padding(
                              padding: getPadding(left: 1, top: 26),
                              child: Text("Full name",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtGilroyMedium16)),
                          BlocSelector<ProfileEditBloc, ProfileEditState,
                                  TextEditingController?>(
                              selector: (state) => state.group10198Controller,
                              builder: (context, group10198Controller) {
                                return CustomTextFormField(
                                    focusNode: FocusNode(),
                                    controller: group10198Controller,
                                    hintText: "Emna syasn",
                                    margin: getMargin(left: 1, top: 8));
                              }),
                          // Padding(
                          //     padding: getPadding(left: 1, top: 19),
                          //     child: Text("last_name",
                          //         overflow: TextOverflow.ellipsis,
                          //         textAlign: TextAlign.left,
                          //         style: AppStyle.txtGilroyMedium16)),
                          // BlocSelector<ProfileEditBloc, ProfileEditState,
                          //         TextEditingController?>(
                          //     selector: (state) =>
                          //         state.group10198OneController,
                          //     builder: (context, group10198OneController) {
                          //       return CustomTextFormField(
                          //           focusNode: FocusNode(),
                          //           controller: group10198OneController,
                          //           hintText: "syasn",
                          //           margin: getMargin(left: 1, top: 7));
                          //     }),
                          Padding(
                              padding: getPadding(left: 1, top: 18),
                              child: Text("Password",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      AppStyle.txtGilroyMedium16Bluegray800)),
                          BlocSelector<ProfileEditBloc, ProfileEditState,
                                  TextEditingController?>(
                              selector: (state) => state.emailController,
                              builder: (context, emailController) {
                                return CustomTextFormField(
                                    focusNode: FocusNode(),
                                    controller: emailController,
                                    hintText: "***********",
                                    margin: getMargin(left: 1, top: 8),
                                    textInputType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null ||
                                          (!isValidEmail(value,
                                              isRequired: true))) {
                                        return "Please enter valid email";
                                      }
                                      return null;
                                    });
                              }),
                          Padding(
                              padding: getPadding(left: 1, top: 18),
                              child: Text("Confirm Password",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      AppStyle.txtGilroyMedium16Bluegray800)),
                          BlocSelector<ProfileEditBloc, ProfileEditState,
                                  TextEditingController?>(
                              selector: (state) => state.weburlController,
                              builder: (context, weburlController) {
                                return CustomTextFormField(
                                    focusNode: FocusNode(),
                                    controller: weburlController,
                                    hintText: "******",
                                    margin: getMargin(left: 1, top: 8));
                              }),
                          Padding(
                              padding: getPadding(left: 1, top: 18),
                              child: Text("Mobile Number",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      AppStyle.txtGilroyMedium16Bluegray800)),
                          BlocSelector<ProfileEditBloc, ProfileEditState,
                                  TextEditingController?>(
                              selector: (state) => state.mobileNoController,
                              builder: (context, mobileNoController) {
                                return CustomTextFormField(
                                    focusNode: FocusNode(),
                                    controller: mobileNoController,
                                    hintText: "124587147",
                                    margin: getMargin(left: 1, top: 8),
                                    textInputAction: TextInputAction.done);
                              }),
                          CustomButton(
                              height: getVerticalSize(50),
                              text: "Save",
                              margin: getMargin(left: 2, top: 24, bottom: 5))
                        ])))));
  }

  onTapImgArrowleft(BuildContext context) {
    NavigatorService.goBack();
  }
}
