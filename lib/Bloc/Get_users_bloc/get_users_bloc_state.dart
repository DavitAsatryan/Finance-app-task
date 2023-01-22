part of 'get_users_bloc_bloc.dart';

@immutable
abstract class GetUsersBlocState extends Equatable {
  const GetUsersBlocState();
  @override
  List<Object> get props => [];
}

class GetUsersBlocInitialState extends GetUsersBlocState {}

class GetUsersBlocLoadingState extends GetUsersBlocState {}

class GetUsersBlocFetchSuccsesState extends GetUsersBlocState {
  List<UserModel> userModel;
  GetUsersBlocFetchSuccsesState({required this.userModel});
}

class GetUsersBlocErrorState extends GetUsersBlocState {
  String error;
  GetUsersBlocErrorState({required this.error});
}
