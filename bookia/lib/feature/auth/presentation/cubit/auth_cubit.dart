import 'package:bookia/core/services/local_helper.dart';
import 'package:bookia/feature/auth/data/models/request/auth_params.dart';
import 'package:bookia/feature/auth/data/repo/auth_repo.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  register(AuthParams params) {
    emit(AuthLoadingState());
    AuthRepo.register(params).then((value) {
      if (value != null) {
        AppLocalStorage.cacheData(AppLocalStorage.tokenKey, value.data?.token);
        emit(AuthSuccessState());
      } else {
        emit(AuthErrorState(error: 'something went wrong'));
      }
    });
  }

  login(AuthParams params) {
    emit(AuthLoadingState());
    AuthRepo.login(params).then((value) {
      if (value != null) {
        AppLocalStorage.cacheData(AppLocalStorage.tokenKey, value.data?.token);
        emit(AuthSuccessState());
      } else {
        emit(AuthErrorState(error: 'something went wrong'));
      }
    });
  }
}
