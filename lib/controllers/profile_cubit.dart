import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState(firstName: "John", lastName: "Doe"));

  void changeFirstName(String newFirstName) {
    emit(state.copyWith(firstName: newFirstName));
  }

  void changeLastName(String newLastName) {
    emit(state.copyWith(lastName: newLastName));
  }
}
