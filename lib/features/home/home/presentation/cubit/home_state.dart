part of 'home_cubit.dart';

class HomeStateCubit extends Equatable {
  const HomeStateCubit({
    this.dateTime,
    this.user,
    this.address,
    this.isLoadingLocation = false,
    this.isCheckedIn = false,
    this.isCheckedOut = false,
    this.checkInTime,
    this.checkOutTime,
    this.checkInStatus,
    this.checkOutStatus,
  });

  final DateTime? dateTime;
  final UserLogin? user;
  final String? address;
  final bool isLoadingLocation;
  final bool isCheckedIn;
  final bool isCheckedOut;
  final String? checkInTime;
  final String? checkOutTime;
  final String? checkInStatus;
  final String? checkOutStatus;

  HomeStateCubit copyWith({
    DateTime? dateTime,
    UserLogin? user,
    String? address,
    bool? isLoadingLocation,
    bool? isCheckedIn,
    bool? isCheckedOut,
    String? checkInTime,
    String? checkOutTime,
    String? checkInStatus,
    String? checkOutStatus,
  }) {
    return HomeStateCubit(
      dateTime: dateTime ?? this.dateTime,
      user: user ?? this.user,
      address: address ?? this.address,
      isLoadingLocation: isLoadingLocation ?? this.isLoadingLocation,
      isCheckedIn: isCheckedIn ?? this.isCheckedIn,
      isCheckedOut: isCheckedOut ?? this.isCheckedOut,
      checkInTime: checkInTime ?? this.checkInTime,
      checkOutTime: checkOutTime ?? this.checkOutTime,
      checkInStatus: checkInStatus ?? this.checkInStatus,
      checkOutStatus: checkOutStatus ?? this.checkOutStatus,
    );
  }

  @override
  List<Object?> get props => [
    dateTime,
    user,
    address,
    isLoadingLocation,
    isCheckedIn,
    isCheckedOut,
    checkInTime,
    checkOutTime,
    checkInStatus,
    checkOutStatus,
  ];
}
