import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:financial_application/Models/UserModel/user_model.dart';
import 'package:financial_application/Repository/repository.dart';
import 'package:meta/meta.dart';

part 'get_users_bloc_event.dart';
part 'get_users_bloc_state.dart';

class GetUsersBlocBloc extends Bloc<GetUsersBlocEvent, GetUsersBlocState> {
  GetUsersBlocBloc() : super(GetUsersBlocInitialState()) {
    List<UserModel> userModel = [];

    on<GetUsersBlocEvent>((event, emit) async {
      if (event is GetUsersBlocEventInitial) {
        emit(GetUsersBlocLoadingState());
        try {

          await Repository.getUsers().then(
            (value) {
              userModel.addAll(value);
            },
            
          );

          emit(GetUsersBlocFetchSuccsesState(userModel: userModel));
        } catch (e) {
          emit(GetUsersBlocErrorState(error: e.toString()));
        }
      }
    });
  }
}
