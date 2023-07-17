import 'package:bloc/bloc.dart';
import 'package:emnapp/presentation/profile/profile_edit/models/edit_profile_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'profile_edit_event.dart';
part 'profile_edit_state.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  ProfileEditBloc (ProfileEditState initialState) : super(initialState) {
        on<EditProfileInitialEvent>(_onInitialize);

    //on<ProfileEditEvent>((event, emit) {
      // TODO: implement event handler
   // }
    //);
  }
  _onInitialize(
    EditProfileInitialEvent event,
    Emitter<ProfileEditState> emit,
  ) async {
    emit(state.copyWith(
        group10198Controller: TextEditingController(),
        group10198OneController: TextEditingController(),
        emailController: TextEditingController(),
        weburlController: TextEditingController(),
        mobileNoController: TextEditingController()));
  }
}
