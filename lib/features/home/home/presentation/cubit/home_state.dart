part of 'home_cubit.dart';

class HomeStateCubit extends Equatable {
  const HomeStateCubit({this.dateTime});

  final DateTime? dateTime;

  HomeStateCubit copyWith({DateTime? dateTime}) {
    return HomeStateCubit(dateTime: dateTime ?? this.dateTime);
  }

  @override
  List<Object?> get props => [dateTime];
}
