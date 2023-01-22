part of 'get_users_bloc_bloc.dart';

@immutable
abstract class GetUsersBlocEvent extends Equatable {
  const GetUsersBlocEvent();
  @override
  List<Object> get props => [];
}

class GetUsersBlocEventInitial extends GetUsersBlocEvent {}
