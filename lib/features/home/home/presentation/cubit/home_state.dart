part of 'home_cubit.dart';

class HomeStateCubit extends Equatable {
  const HomeStateCubit({
    this.dateTime,
    this.user,
    this.address,
    this.isLoadingLocation = false,
  });

  final DateTime? dateTime;
  final UserLogin? user;
  final String? address;
  final bool isLoadingLocation;

  HomeStateCubit copyWith({
    DateTime? dateTime,
    UserLogin? user,
    String? address,
    bool? isLoadingLocation,
  }) {
    return HomeStateCubit(
      dateTime: dateTime ?? this.dateTime,
      user: user ?? this.user,
      address: address ?? this.address,
      isLoadingLocation: isLoadingLocation ?? this.isLoadingLocation,
    );
  }

  @override
  List<Object?> get props => [dateTime, user, address, isLoadingLocation];
}
