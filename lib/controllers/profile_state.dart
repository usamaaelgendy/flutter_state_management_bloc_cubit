part of 'profile_cubit.dart';


class ProfileState extends Equatable {
  final String firstName;
  final String lastName;

  const ProfileState({required this.firstName, required this.lastName});

  ProfileState copyWith({String? firstName, String? lastName}) {
    return ProfileState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  @override
  List<Object?> get props => [firstName, lastName];
}
