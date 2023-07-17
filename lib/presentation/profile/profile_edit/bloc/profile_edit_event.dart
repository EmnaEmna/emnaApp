part of 'profile_edit_bloc.dart';

@immutable
abstract class ProfileEditEvent extends Equatable {
  // const ProfileEditEvent();

  // @override
  // List<Object> get props => [];
}

class EditProfileInitialEvent extends ProfileEditEvent {
  @override
  List<Object?> get props => [];
}
