part of 'profile_cubit.dart';

class ProfileStateCubit extends Equatable {
  const ProfileStateCubit({this.isLoading = false, this.profile, this.failure});

  final bool isLoading;
  final ProfileEntity? profile;
  final MorphemeFailure? failure;

  ProfileStateCubit copyWith({
    bool? isLoading,
    ProfileEntity? profile,
    MorphemeFailure? failure,
  }) {
    return ProfileStateCubit(
      isLoading: isLoading ?? this.isLoading,
      profile: profile ?? this.profile,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [isLoading, profile, failure];
}
