part of 'register_cubit.dart';

class RegisterStateCubit extends Equatable {
  const RegisterStateCubit({this.listCompany = const []});

  final List<DataListCompany> listCompany;

  RegisterStateCubit copyWith({List<DataListCompany>? listCompany}) {
    return RegisterStateCubit(listCompany: listCompany ?? this.listCompany);
  }

  @override
  List<Object?> get props => [listCompany];
}
