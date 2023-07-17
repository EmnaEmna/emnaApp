part of 'profile_edit_bloc.dart';

 class ProfileEditState extends Equatable {
   ProfileEditState({
    this.group10198Controller,
    this.group10198OneController,
    this.emailController,
    this.weburlController,
    this.mobileNoController,
    this.editProfileModelObj,
   });
  TextEditingController? group10198Controller;

  TextEditingController? group10198OneController;

  TextEditingController? emailController;

  TextEditingController? weburlController;

  TextEditingController? mobileNoController;

  EditProfileModel? editProfileModelObj;
  @override
  List<Object?> get props => [
        group10198Controller,
        group10198OneController,
        emailController,
        weburlController,
        mobileNoController,
        editProfileModelObj,
      ];

  ProfileEditState copyWith({
    TextEditingController? group10198Controller,
    TextEditingController? group10198OneController,
    TextEditingController? emailController,
    TextEditingController? weburlController,
    TextEditingController? mobileNoController,
    EditProfileModel? editProfileModelObj,
  }) {
    return ProfileEditState(
      group10198Controller: group10198Controller ?? this.group10198Controller,
      group10198OneController:
          group10198OneController ?? this.group10198OneController,
      emailController: emailController ?? this.emailController,
      weburlController: weburlController ?? this.weburlController,
      mobileNoController: mobileNoController ?? this.mobileNoController,
      editProfileModelObj: editProfileModelObj ?? this.editProfileModelObj,
    );
  }

}

//class ProfileEditInitial extends ProfileEditState {}
